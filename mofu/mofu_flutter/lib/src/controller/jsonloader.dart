import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//not used
class JsonLoader extends GetxController {
  static JsonLoader get to => Get.find();
  var recipe = <Map<String, dynamic>>[].obs;
  @override
  void onInit() async {
    super.onInit();
    _loadJsonFile();
  }

  void _loadJsonFile() async {
    if (Get.context != null) {
      String data = await DefaultAssetBundle.of(Get.context!)
          .loadString("assets/json/recipe.json");
      recipe(json.decode(data).cast<Map<String, dynamic>>().toList());
    } else {
      Future.delayed(Duration(milliseconds: 200), _loadJsonFile);
    }
  }
}