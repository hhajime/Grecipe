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
  bool overlap = false;
  late AsyncSnapshot<Recipes> snapshots = AsyncSnapshot.nothing();
  recipeListGenetator() {
    print('here 1 ${avaliableRecipe.toString()}');
    var firstListSet = avaliableRecipe.toSet();
    var secondListSet = {
      ['$elementat'],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPNM)],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).RCPPARTSDTLS)],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUAL01)],
      [(snapshots.data!.COOKRCP02.row.elementAt(elementat).MANUALIMG01)]
    }.toSet();
    
    if (firstListSet.intersection(secondListSet) == '') {
      overlap = true;
    }

    if (secondListSet
        .toList()
        .every((item) => avaliableRecipe.contains(item))) {
      overlap = true;
    }
    if (overlap == false) {
      avaliableRecipe.add(secondListSet.toList());
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
