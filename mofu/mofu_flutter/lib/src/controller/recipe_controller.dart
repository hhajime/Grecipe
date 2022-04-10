import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/data/model/recipe_model.dart';
import 'package:http/http.dart' as http;

Future<Recipes> fetchPost() async {
  final response =
      await http.get(Uri.parse('http://openapi.foodsafetykorea.go.kr/api/b298cbc720e7426ca59a/COOKRCP01/json/0/2'));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Recipes.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class RecipeController extends GetxController {
late Future<Recipes> recipe;
  @override
  void onInit() {
    super.onInit();
    recipe = fetchPost();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
