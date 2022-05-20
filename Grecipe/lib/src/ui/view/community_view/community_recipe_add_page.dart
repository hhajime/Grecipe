import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grecipe/src/controller/community_recipe_add_controller.dart';

class CommunityRecipeAddPage extends StatelessWidget {
  final rcpAddController = CommunityRecipeAddController();

  CommunityRecipeAddPage({Key? key}) : super(key: key);
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
            body: CustomScrollView(slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black12,
            stretch: true,
            expandedHeight: displayHeight * 0.2,
            flexibleSpace: FlexibleSpaceBar(
                background: Obx(() => InkWell(
                    onTap: () {
                      rcpAddController.pickImage(ImageSource.gallery);
                    },
                    child: rcpAddController.selectedImagePath.value == ''
                        ? Center(
                            child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: displayHeight * 0.2,
                                color: Colors.white),
                          ))
                        : Image.file(
                            File(rcpAddController.selectedImagePath.value))))),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                height: displayHeight * 0.8,
                width: displayWidth * 0.8,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 10),
                        width: displayWidth * 0.8,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                                width: displayWidth * 0.2,
                                child: Text('글 제목',
                                    style: TextStyle(
                                        fontSize: displayHeight * 0.02,
                                        fontWeight: FontWeight.bold))),
                            Container(
                                width: displayWidth * 0.59,
                                height: displayHeight * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: subColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          color: Colors.black12,
                                          blurRadius: 10,
                                          spreadRadius: 5)
                                    ],
                                    border:
                                        Border.all(color: mainColor, width: 2)),
                                child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const TextField(
                                        decoration: InputDecoration(
                                      hintText: ' ex) 요리 레시피 ep1',
                                      border: InputBorder.none,
                                    ))))
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.only(top: 10),
                        width: displayWidth * 0.8,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                                width: displayWidth * 0.2,
                                child: Text('요리 소개',
                                    style: TextStyle(
                                        fontSize: displayHeight * 0.02,
                                        fontWeight: FontWeight.bold))),
                            Container(
                                width: displayWidth * 0.59,
                                height: displayHeight * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: subColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          color: Colors.black12,
                                          blurRadius: 10,
                                          spreadRadius: 5)
                                    ],
                                    border:
                                        Border.all(color: mainColor, width: 2)),
                                child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const TextField(
                                        minLines: 1,
                                        maxLines: 5,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          hintText:
                                              ' ex) 요리 레시피 ep1 입니다. 쉽고 빠르게 맛있는 요리를 조리해보세요!',
                                          border: InputBorder.none,
                                        ))))
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                height: 500,
                color: Colors.red,
              )
            ],
          ))
        ])));
  }
}
