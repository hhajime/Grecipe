import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:hive/hive.dart';
import 'package:grecipe/src/data/model/ingredient.dart';

class IngredientDBController extends GetxController {
  TextEditingController te = TextEditingController();
  CreateIng() async {
    var box = await Hive.openBox<Ingredients>('ingredient');
    box.put(
        'ingredient',
        Ingredients(
            index: index,
            ingredientName: selectedIcon,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text));
  }

  ReadIng() async {}
  UpdateIng() async {}
  DeleteIng() async {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
