import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/controller/bottom_navigation_controller.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/mypage_view/mypage_page.dart';
import 'package:mofu_flutter/src/ui/view/home_view/home_page.dart';
import 'package:mofu_flutter/src/ui/view/foodvision_view/foodvision_page.dart';
import 'package:mofu_flutter/src/ui/widget/image_detection.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: displayHeight * 0.07,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: mainColor,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'fridge',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 20.0,
                  ),
                ),
                label: 'food vision',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarController landingPageController =
        Get.put(BottomNavigationBarController(), permanent: false);
    return Container(
        color: mainColor,
        child: SafeArea(
            child: Scaffold(
          bottomNavigationBar:
              buildBottomNavigationMenu(context, landingPageController),
          body: Obx(() => IndexedStack(
                index: landingPageController.tabIndex.value,
                children: [
                  HomePage(),
                  StaticImage(),
                  MyPage(),
                ],
              )),
        )));
  }
}
