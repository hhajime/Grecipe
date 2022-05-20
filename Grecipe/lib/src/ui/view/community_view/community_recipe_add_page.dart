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
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                background: Obx(() =>
                    rcpAddController.selectedImagePath.value == ''
                        ? InkWell(
                            onTap: () {
                              rcpAddController.pickImage(ImageSource.gallery);
                            },
                            child: const Text(
                              'No image Selected',
                              style: TextStyle(fontSize: 50),
                            ))
                        : Image.file(
                            File(rcpAddController.selectedImagePath.value)))),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                height: 500,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                            labelStyle: TextStyle(color: Colors.black)),
                        onChanged: (value) {
                          rcpAddController.title.value = value;
                        },
                      ),
                    ),
                    Container()
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
