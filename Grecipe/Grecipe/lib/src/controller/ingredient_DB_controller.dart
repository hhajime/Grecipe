import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:hive/hive.dart';
import 'package:grecipe/src/data/model/ingredient.dart';

class IngredientDBController extends GetxController {
    var dataBox = Hive.box<DataModel>('db');
  RxString selectedIcon = '달걀'.obs;
  createIng() {
    DataModel data = DataModel(
            index: dataBox.length,
            ingredientName: selectedIcon.value,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text);
    dataBox.add(data);
    print('added data is ${data.index}, ${data.ingredientName}, ${data.userSpecIngredientName}, ${data.shelfLife}, ${data.memo}');
    //print('db length: ${dataBox.length}');
    dataBox.values.forEach((element) { 
      print('all DB : ${element.index}, ${element.ingredientName}, ${element.userSpecIngredientName}, ${element.shelfLife}, ${element.memo}');
    });
    dbSort();
    var d = dataBox.values;
    update();
  }

  readIng(index) {
    print('db created');
    print('this ${dataBox.values.map((e) => e.index).toList()[index]}');
    print('this ${dataBox.values.map((e) => e.ingredientName).toList()[index]}');
    print('this ${dataBox.values.map((e) => e.userSpecIngredientName).toList()[index]}');
    print('this ${dataBox.values.map((e) => e.shelfLife).toList()[index]}');
    print('this ${dataBox.values.map((e) => e.memo).toList()[index]}');
    /** 
    print('db created');
    print('index = ${dataBox.toMap()[index]?.toJson().toString().split(',')[0].substring(7)}');
    print('ingredientName = ${dataBox.toMap()[index]?.toJson().toString().split(',')[1].substring(17)}');
    print('userSpecIngredientName = ${dataBox.toMap()[index]?.toJson().toString().split(',')[2].substring(24)}');
    print('shelfLife = ${dataBox.toMap()[index]?.toJson().toString().split(',')[3].substring(11)}');
    print('memo = ${dataBox.toMap()[index]?.toJson().toString().split(',')[4].substring(6)}');
    **/
  }
  
  updateIng(index) async {
    DataModel data = DataModel(
            index: index,
            ingredientName: selectedIcon.value,
            userSpecIngredientName: ingname.text,
            shelfLife: shelfLife,
            memo: ingmemo.text);
    dataBox.putAt(index, data);
    print('db updated ${data}');
    //print('db length: ${dataBox.length}');
    update();
  }

  deleteIng(index) async {
    dataBox.delete(index);
    print('db deleted');
    //print('db length: ${dataBox.length}');
    //sorting
    //dbSort();
    update();
  }

  dbSort(){
  }

  dbSort2(){
    dataBox.values.toList().sort((a,b){
      return a.index.compareTo(b.index);
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
