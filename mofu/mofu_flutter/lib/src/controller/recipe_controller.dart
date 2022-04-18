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
  RxInt elementat = 0.obs;
  RxInt count2 = 0.obs;
  RxInt row = 0.obs;
  RxInt col = 0.obs;
  List<List> avaliableRecipe = <List>[
    [
      ['first'],
      ['비트양파김치'],
      [
        '[양파 150g, 절임물 : 물 200g,  볶은소금 2g,  식초 15g,  비트 2g, 국물 : 절임물 100g,  생강청 30g,  식초 15g,  청양고추 7g]'
      ],
      ['물붇기'],
      ['이미지링크']
    ]
  ].obs;

late AsyncSnapshot<Recipes> snapshots;
  recipeListGenetator() {
    elementat++;
    avaliableRecipe.add([
      ['${elementat.value}'],
      ['${snapshots.data!.COOKRCP02.row.elementAt(elementat.value).RCPNM}'],
      [
        '${snapshots.data!.COOKRCP02.row.elementAt(elementat.value).RCPPARTSDTLS}'
      ],
      ['${snapshots.data!.COOKRCP02.row.elementAt(elementat.value).MANUAL01}'],
      [
        '${snapshots.data!.COOKRCP02.row.elementAt(elementat.value).MANUALIMG01}'
      ]
    ]);
    count2++;
    update();
  }

  @override
  void onInit() {
    super.onInit(); 
    snapshots = [] as AsyncSnapshot<Recipes>;
    recipe = readJson();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
  // executes after build
   recipeListGenetator();
  });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
