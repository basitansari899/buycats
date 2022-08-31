import 'package:buy_cats/controller/cat_list_controller.dart';
import 'package:buy_cats/models/cat_model.dart';
import 'package:buy_cats/widets/list_card.dart';
import 'package:buy_cats/widets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatListContent extends StatelessWidget {
  final List<CatModel> catList;
  final int widgetLength;
  final bool isList;
  final Widget? widget;
  final String errorMessage;

  const CatListContent({
    Key? key,
    required this.catList,
    this.errorMessage = '',
    this.widgetLength = 2,
    this.isList = true,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catControllerList = Get.put(CatListController()).obs;
    Future<void> initializeSettings() async {
      catControllerList.value.catList;
      catControllerList.value.userData;
      //Simulate other services for 3 seconds
      await Future.delayed(const Duration(seconds: 1));
    }

    return FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget(widgetLength: widgetLength);
          }
          if (snapshot.hasError ||
              catControllerList.value.activeConnection.value == false) {
            return Text(
              errorMessage,
              style: const TextStyle(fontSize: 16),
            );
          } else {
            return isList
                ? Column(
                    children: List.generate(
                      catList.length,
                      (i) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Obx(
                              () => LTCard(
                                catName: catList[i].name,
                                catDescription: catList[i].description,
                                catImageLink: catControllerList
                                            .value.activeConnection.value ==
                                        true
                                    ? catList[i].catImageLink
                                    : null,
                                isFav: catControllerList.value
                                    .favList(catList[i].catId ?? ''),
                                onTap: () {
                                  if (catControllerList.value
                                      .favList(catList[i].catId ?? '')) {
                                    catControllerList.value
                                        .deleteFavCat(catList[i].catId!);
                                  } else {
                                    catControllerList.value
                                        .addFavCat(catList[i].catId!);
                                  }
                                },
                              ),
                            ));
                      },
                    ),
                  )
                : widget ?? const SizedBox();
          }
        });
  }
}