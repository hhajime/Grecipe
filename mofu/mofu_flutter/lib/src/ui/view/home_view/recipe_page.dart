import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/model/recipe_model.dart';
import 'package:mofu_flutter/src/controller/recipe_controller.dart';
import 'package:get/get.dart';

class RecipePage extends StatelessWidget {
  final recipeController = Get.put(RecipeController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Recipes>(
            future: recipeController.recipe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.COOKRCP02.row.first.RCPPARTSDTLS);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // 기본적으로 로딩 Spinner를 보여줍니다.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}