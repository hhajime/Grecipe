import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(child:
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: mainColor)),
            child: Text('ALL')))),
    Tab(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: mainColor)),
            child: Row(
      children: [
        Image.asset(
          "assets/images/icons/expiration_icon/good_1.png",
          height: 10,
          width: 10,
        ),
        Padding(padding: EdgeInsets.only(right: 5)),
        Text('10 items'),
      ],
    )))),
    Tab(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: mainColor)),
            child: Row(
      children: [
        Image.asset(
          "assets/images/icons/expiration_icon/fridged_1.png",
          height: 10,
          width: 10,
        ),
        Padding(padding: EdgeInsets.only(right: 5)),
        Text('10 items'),
      ],
    )))),
    Tab(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                               border: Border.all(color: mainColor),),
            child: Row(
      children: [
        Image.asset(
          "assets/images/icons/expiration_icon/danger_1.png",
          height: 10,
          width: 10,
        ),
        Padding(padding: EdgeInsets.only(right: 5)),
        Text('10 items'),
      ],
    )))),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
