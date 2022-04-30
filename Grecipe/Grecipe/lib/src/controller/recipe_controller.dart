import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:grecipe/src/controller/ingredient_DB_controller.dart';
import '../data/list.dart';

Future<Recipes> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/recipe.json');

  return Recipes.fromJson(json.decode(response));
}

class RecipeController extends GetxController {
  final ingDbController = Get.put(IngredientDBController(), permanent: false);
  late Future<Recipes> recipe;
  int elementat = 0;
  List<List> avaliableRecipe = <List>[].obs;
  List<String> results = [];
  var all = [];
  bool overlap = false;
  late AsyncSnapshot<Recipes> snapshots = AsyncSnapshot.nothing();

  recipeFinder() {
    avaliableRecipe.clear(); //page 이동시 중첩 발생 방지 임시 -> 개선필요
    for (int i = 0; i < 1358; i++) {
      // 현재 재료를 레시피 데이터와 비교하여 동일한 레시피 찾기
      int count = 0;
      results =
          snapshots.data!.COOKRCP02.row.elementAt(i).RCPPARTSDTLS.split(',');
      for (int j = 0; j < results.length; j++) {
        for (int k = 0; k < ingDbController.ingResult.length; k++) {
          if (results[j].contains(ingDbController.ingResult[k])) {
            // 추후 every contains로 변경필요
            count++;
          }
        }
        if (count == results.length) {
          elementat = i;
          recipeListGenetator();
          //print('this ${snapshot.toString()}');
        }
      }
    }
  }

  recipeListGenetator() {//avaliableRecipe에 존재하지 않는 레시피만 추가하기
    var firstList = avaliableRecipe;
    var secondList = [
      ['$elementat'],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPNM)],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPPARTSDTLS)],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUAL01)],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUALIMG01)]
    ];
    all.add(firstList);
    all.add(secondList);
    for (int i = 0; i < firstList.length; i++) {
      if (all[i].every((item) => secondList.contains(item))) {
        overlap = true;
        print('hello');
      }
    }
    if (overlap == false) {
      avaliableRecipe.add(secondList);
      update();
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
