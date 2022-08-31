import 'package:buy_cats/constants/app_constants.dart';
import 'package:buy_cats/controller/cat_list_controller.dart';
import 'package:buy_cats/widets/image_widget.dart';
import 'package:buy_cats/widets/list_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catListController = Get.find<CatListController>().obs;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatListContent(
                errorMessage: StringConstant.ERROR_MESSAGE_PROFILE,
                catList: [],
                isList: false,
                widgetLength: 1,
                widget: Obx(() => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              catListController.value.userData.value.name,
                              style: TextStyles.HEADING_STYLE,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const Text(
                                    StringConstant.USER_AGE + ':',
                                    style: TextStyles.SUBHEAD_STYLE,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    catListController.value.userData.value.age,
                                    style: TextStyles.NORMAL_TEXT,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ImageWidget(
                            imageLink: catListController
                                .value.userData.value.profilelink)
                      ],
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                StringConstant.MY_CATS,
                style: TextStyles.HEADING_STYLE,
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => CatListContent(
                  catList: catListController.value.favCatList(),
                  widgetLength: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
