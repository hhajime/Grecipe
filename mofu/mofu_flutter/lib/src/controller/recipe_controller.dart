import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/data/model/recipe_model.dart';
import 'package:http/http.dart' as http;

Future<Recipes> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/recipe.json');

  return Recipes.fromJson(json.decode(response));
}

class RecipeController extends GetxController {
  late Future<Recipes> recipe;
  int elementat = 0;
  List<List> avaliableRecipe = <List>[].obs;
  var all = [];
  bool overlap = false;
  late AsyncSnapshot<Recipes> snapshots = AsyncSnapshot.nothing();
  recipeListGenetator() {
    print('start ${overlap}');
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
    for(int i = 0; i < firstList.length; i++){
    if (all[i]
        .every((item) => secondList.contains(item))) {
      overlap = true;
      print('hello');
    }
    }
    if (overlap == false) {
      avaliableRecipe.add(secondList);
      update();
    }
    print('end ${overlap}');

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
