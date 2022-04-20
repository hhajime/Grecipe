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
            extendBodyBehindAppBar: true,
            body: Stack(children: [
              AppBar(
                leading: BackButton(
                  color: mainColor,
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border_outlined,
                        color: mainColor,
                      ))
                ],
              ),
              SingleChildScrollView(child: recipes(500)),
            ]),
          ),
        ),
      ),
    );
  }

  recipes(index) {
    return FutureBuilder<Recipes>(
      future: recipeController.recipe,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<String> result = [];
          for (int i = 0; i < 1358; i++) {
            int count = 0;
            result = snapshot.data!.COOKRCP02.row
                .elementAt(i)
                .RCPPARTSDTLS
                .split(',');
            for (int j = 0; j < result.length; j++) {
              for (int k = 0; k < ingResult.length; k++) {
                if (result[j].contains(ingResult[k])) {
                  // include로 변경
                  count++;
                }
              }
              if (count == result.length) {
                print(
                    'here2 $result, ${result.length}, ${snapshot.data!.COOKRCP02.row.elementAt(i).RCPNM}');
              }
            }
          }
          return Column(
            children: [
              SizedBox(
                width: displayWidth,
                height: displayHeight * 0.2,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.network(snapshot.data!.COOKRCP02.row
                        .elementAt(index)
                        .ATTFILENOMAIN)),
              ),
              Container(
                width: displayWidth * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    //Text(recipeController.recipe.asStream().toString()),
                    Container(
                        width: displayWidth * 0.8,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 10, bottom: 13),
                        child: Text(
                          snapshot.data!.COOKRCP02.row.elementAt(index).RCPNM,
                          style: TextStyle(
                              fontSize: displayHeight * 0.025,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "재료",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: displayHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(snapshot.data!.COOKRCP02.row
                            .elementAt(index)
                            .RCPPARTSDTLS)),
                    Container(
                        padding: const EdgeInsets.only(top : 20, left: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "조리순서",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: displayHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                        snapshot.data!.COOKRCP02.row.elementAt(index).MANUAL01),
                    Image.network(snapshot.data!.COOKRCP02.row
                        .elementAt(index)
                        .MANUALIMG01),
                    Text(
                        snapshot.data!.COOKRCP02.row.elementAt(index).MANUAL02),
                    Image.network(snapshot.data!.COOKRCP02.row
                        .elementAt(index)
                        .MANUALIMG02),
                    Text(
                        snapshot.data!.COOKRCP02.row.elementAt(index).MANUAL03),
                    Image.network(snapshot.data!.COOKRCP02.row
                        .elementAt(index)
                        .MANUALIMG03),
                    Text(snapshot.data!.COOKRCP02.row
                        .elementAt(index)
                        .MANUAL04), //이미지 없으면 표시되지 않게
                  ],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // 기본적으로 로딩 Spinner를 보여줍니다.
        return const CircularProgressIndicator();
      },
    );
  }
}
