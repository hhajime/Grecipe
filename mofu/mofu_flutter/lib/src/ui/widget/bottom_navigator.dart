import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/mypage_view/mypage_page.dart';
import 'package:mofu_flutter/src/ui/view/home_view/home_page.dart';
import 'package:mofu_flutter/src/ui/widget/foodvision_page_getx.dart';
import 'package:get/get.dart';

final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12);

final TextStyle selectedLabelStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

Widget myBNBar(context, landingPageController) {
  int _selectedIndex = 0;
  return Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainColor,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        onTap: landingPageController.changeTabIndex,
        currentIndex: landingPageController.tabIndex.value,
        items: [
          BottomNavigationBarItem(
            label: 'fridge',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'food vision',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'my page',
            icon: Icon(Icons.person),
          ),
        ],
      ));
}
