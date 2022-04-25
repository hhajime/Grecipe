import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:hive/hive.dart';
import 'package:grecipe/src/data/model/ingredient.dart';

class IngredientDBController extends GetxController {
  TextEditingController te = TextEditingController();
    var dataBox = Hive.box<DataModel>('db');
    String test = '';
  createIng() {
    DataModel data = DataModel(
            index: dataBox.length,
            ingredientName: selectedIcon,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text);
    dataBox.add(data);
    /**dataBox.put(
        'ingredient',
        DataModel(
            index: dataBox.length,
            ingredientName: selectedIcon,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text));**/
    test = dataBox.get('ingredientName').toString();
    print('db created $test');
  }

  readIng() {
    test = dataBox.get('ingredientName').toString();
    print('read db ingname is ${test}');
  }
  updateIng() async {}
  deleteIng() async {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
