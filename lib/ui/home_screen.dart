import 'package:buy_cats/constants/app_constants.dart';
import 'package:buy_cats/controller/cat_list_controller.dart';
import 'package:buy_cats/widets/list_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catControllerList = Get.put(CatListController()).obs;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConstant.Featured_TITLE,
                style: TextStyles.HEADING_STYLE,
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => CatListContent(
                    errorMessage: StringConstant.ERROR_MESSAGE,
                    catList: catControllerList.value.featureCatList(true),
                  )),
              const SizedBox(
                height: 30,
              ),
              const Text(
                StringConstant.ALL_CAT_TITLE,
                style: TextStyles.HEADING_STYLE,
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => CatListContent(
                    catList: catControllerList.value.featureCatList(false),
                    widgetLength: 3,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


