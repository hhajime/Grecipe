import 'dart:async';
import 'dart:convert';
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
