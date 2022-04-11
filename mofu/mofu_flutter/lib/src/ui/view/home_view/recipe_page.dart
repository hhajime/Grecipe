import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/model/recipe_model.dart';
import 'package:mofu_flutter/src/controller/recipe_controller.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/widget/landing_page.dart';

class RecipePage extends StatelessWidget {
  final recipeController = Get.put(RecipeController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: mainColor,
                onPressed: () {
                  Get.to(() => LandingPage(), transition: Transition.cupertino);
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                '레시피 이름',
                style:
                    TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
              ),
            ),
            body: Center(
              child: FutureBuilder<Recipes>(
                future: recipeController.recipe,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(snapshot.data!.COOKRCP02.row.first.RCPNM),
                        Text(snapshot.data!.COOKRCP02.row.first.RCPPARTSDTLS),
                        Text(snapshot.data!.COOKRCP02.row.first.MANUAL01),
                        Image.network(snapshot.data!.COOKRCP02.row.first.MANUALIMG01),
                        Text(snapshot.data!.COOKRCP02.row.first.MANUAL02),
                        Image.network(snapshot.data!.COOKRCP02.row.first.MANUALIMG02),
                        Text(snapshot.data!.COOKRCP02.row.first.MANUAL03),
                        Image.network(snapshot.data!.COOKRCP02.row.first.MANUALIMG03),
                        Text(snapshot.data!.COOKRCP02.row.first.MANUAL04),//이미지 없으면 표시되지 않게
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // 기본적으로 로딩 Spinner를 보여줍니다.
                  return CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
