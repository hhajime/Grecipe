import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:hive/hive.dart';
import 'package:grecipe/src/data/model/ingredient.dart';
import 'package:grecipe/src/controller/reactive_controller.dart';

class IngredientDBController extends GetxController {
  final reactiveController = Get.put(ReactiveController(), permanent: false);
    var dataBox = Hive.box<DataModel>('db');
  createIng() {
    DataModel data = DataModel(
            index: dataBox.length,
            ingredientName: reactiveController.selectedIcon.value,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text);
    dataBox.add(data);
    print('db added ${data.toJson()}');
    print('db length: ${dataBox.length}');
    update();
  }

  readIng(index) {
    print('db created');
    print('index = ${dataBox.toMap()[index]?.toJson().toString().split(',')[0].substring(7)}');
    print('ingredientName = ${dataBox.toMap()[index]?.toJson().toString().split(',')[1].substring(17)}');
    print('userSpecIngredientName = ${dataBox.toMap()[index]?.toJson().toString().split(',')[2].substring(24)}');
    print('shelfLife = ${dataBox.toMap()[index]?.toJson().toString().split(',')[3].substring(11)}');
    print('memo = ${dataBox.toMap()[index]?.toJson().toString().split(',')[4].substring(6)}');
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
