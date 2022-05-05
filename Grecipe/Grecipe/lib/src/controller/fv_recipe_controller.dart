import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/recipe_model.dart';
import 'package:grecipe/src/controller/food_vision_ing_controller.dart';

Future<Recipes> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/recipe.json');

  return Recipes.fromJson(json.decode(response));
}

class FoodVisionRecipeController extends GetxController {
  final fvingController = Get.put(FoodVisionIngController(), permanent: false);
  late Future<Recipes> recipe;
  int elementat = 0;
  RxInt selectedRecipe = 0.obs;
  RxList selectedRecipeIndex = [].obs;
  List<List> avaliableRecipe = <List>[];
  List<String> results = [];
  late AsyncSnapshot<Recipes> snapshots = AsyncSnapshot.nothing();
  recipeFinder() async {
    avaliableRecipe.clear();
    selectedRecipeIndex.clear();
    for (int i = 0; i < 1358; i++) {
      // 현재 재료를 레시피 데이터와 비교하여 동일한 레시피 찾기
      int count = 0;
      results =
          snapshots.data!.COOKRCP02.row.elementAt(i).RCPPARTSDTLS.split(',');
      for (int j = 0; j < results.length; j++) {
        for (int k = 0; k < fvingController.ingResult.length; k++) {
          if (results[j].contains(fvingController.ingResult[k])) {
            //.value?
            // 추후 every contains로 변경필요
            count++;
            //print('intresult : ' + fvingController.ingResult[k] +'  result length : '+ results.length.toString() +'  count: '+ count.toString());
          }
        }
        if (count == results.length - 1) {
          // 레시피 단위 조정(1개 없어도 되도록)
          elementat = i;
          selectedRecipeIndex.add(elementat);
          avaliableRecipe.add([
            ['$elementat'],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPNM)],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPPARTSDTLS)],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUAL01)],
            [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUALIMG01)]
          ]);
          update();
          //print('this ${snapshot.toString()}');
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    recipe = readJson();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
