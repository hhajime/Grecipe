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
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black12,
        stretch: true,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
            background: rcpAddController.titleImage == null
                ? InkWell(
                    onTap: () {
                      rcpAddController.pickImage();
                    },
                    child: const Text(
                      'No image Selected',
                      style: TextStyle(fontSize: 50),
                    ))
                : Image.file(File(rcpAddController.titleImage!.path))),
      ),
      SliverList(
          delegate: SliverChildListDelegate(
        [
          Container(
            height: 500,
            color: Colors.white,
          ),
          Container(
            height: 500,
            color: Colors.red,
          )
        ],
      ))
    ]));
  }
}
