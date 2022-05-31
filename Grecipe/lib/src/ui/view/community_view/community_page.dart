import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/ui/view/community_view/community_recipe_add_page.dart';
import 'package:grecipe/src/ui/view/mypage_view/mypage.dart';
import 'package:grecipe/src/controller/firebase_controller.dart';

class CommunityPage extends StatelessWidget {
  final firebaseController = Get.put(FirebaseCloudFireStoreController());
  CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: mainColor,
                leading: null,
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: false,
                title: Text(
                  'Grecipe',
                  style:
                      TextStyle(color: subColor, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.location_history),
                    onPressed: () {
                      Get.to(() => const MyPage());
                    },
                  ),
                ],
                bottom: AppBar(
                  shadowColor: mainColor,
                  backgroundColor: mainColor,
                  automaticallyImplyLeading: false,
                  title: Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.white,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for recipe',
                            prefixIcon: Icon(Icons.search, color: mainColor),
                            suffixIcon: IconButton(
                              icon:
                                  Icon(Icons.add_box_rounded, color: mainColor),
                              onPressed: () {
                                Get.to(() => CommunityRecipeAddPage());
                              },
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              // Other Sliver Widgets
              SliverList(
                delegate: SliverChildListDelegate([
                  Center(
                      child: SizedBox(
                          height: displayHeight * 0.35,
                          width: displayWidth * 0.8,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Text(
                                    'Trendy Recipes',
                                    style: TextStyle(
                                        fontSize: displayHeight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  height: displayHeight * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: subColor,
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(3, 3),
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      border: Border.all(
                                          color: mainColor, width: 2)),
                                  child: fireStoreOut()),
                            ],
                          ))),
                  Center(
                      child: Container(
                          width: displayWidth * 0.8,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            'Recent',
                            style: TextStyle(
                                fontSize: displayHeight * 0.02,
                                fontWeight: FontWeight.bold),
                          ))),
                  Center(

                      /// 한무 스크롤 가능하게
                      child: Container(
                          height: displayHeight * 0.3,
                          width: displayWidth * 0.8,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: subColor,
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 3),
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ],
                              border: Border.all(color: mainColor, width: 2)),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemExtent: 100,
                            children: [
                              Container(
                                  color: Colors.green,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text('hello'),
                                      ),
                                      Container(
                                        child: Column(),
                                      )
                                    ],
                                  )),
                              Container(
                                color: Colors.red,
                              )
                            ],
                          ))),
                ]),
              ),
            ],
          ),
        ));
  }

  FutureBuilder fireStoreOut() {
    //추후 carousel slider, on tap적용
    return FutureBuilder(
        future: firebaseController.readData(),
        builder: (_, snapShot) {
          return snapShot.data == null
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          width: displayWidth * 0.8,
                          child: Image.network(
                            snapShot.data[0].data()['COOKRCP']['고구마죽']
                                ['RCPMAINIMAGE'],
                            fit: BoxFit.cover,
                          ))),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: displayHeight * 0.06,
                            width: displayWidth * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: Column(children: [
                              Text(
                                '고구마죽',
                                style: TextStyle(
                                    fontSize: displayHeight * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(snapShot.data[0].data()['COOKRCP']['고구마죽']
                                  ['RCP_INTRO'])
                            ]),
                          ))),
                ]);
        });
  }
}
