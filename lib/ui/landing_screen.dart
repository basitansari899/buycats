import 'package:buy_cats/controller/landing_page_controller.dart';
import 'package:buy_cats/ui/home_screen.dart';
import 'package:buy_cats/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

   LandingPage({Key? key}) : super(key: key);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          height: 106,
          decoration: const BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFFBE9E7)],
              begin: Alignment.topLeft,
              end: Alignment.topCenter,
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(36), topLeft: Radius.circular(36)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36.0),
              topRight: Radius.circular(36.0),
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: landingPageController.changeTabIndex,
              currentIndex: landingPageController.tabIndex.value,
              backgroundColor: Colors.transparent,
              unselectedItemColor: const Color.fromRGBO(0, 0, 0, 0.87),
              selectedItemColor: const Color(0xFFFF6F43),
              unselectedLabelStyle: unselectedLabelStyle,
              selectedLabelStyle: selectedLabelStyle,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Image.asset('assets/images/color_menu.png'),
                  ),
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Image.asset('assets/images/black_menu.png'),
                  ),
                  label: 'Cats',
                  backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Image.asset('assets/images/color_face.png'),
                  ),
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Image.asset('assets/images/black_face.png'),
                  ),
                  label: 'Me',
                  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                ),
              ],
            ),
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              HomeScreen(),
              ProfileScreen(),
            ],
          )),
    ));
  }
}
