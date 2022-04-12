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
              Center(
                child: SingleChildScrollView(child: Recipe(0)),
              ),
              AppBar(
                leading: BackButton(
                  color: mainColor,
                  onPressed: () {
                    Get.to(() => LandingPage(),
                        transition: Transition.cupertino);
                  },
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [IconButton(onPressed: (){}, icon: Icon(Icons.star_border_outlined,color: mainColor,))],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Recipe(index) {
    return FutureBuilder<Recipes>(
      future: recipeController.recipe,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                width: displayWidth,
                height: displayHeight * 0.2,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.network(snapshot.data!.COOKRCP02.row
                        .elementAt(index)
                        .ATTFILENOMAIN)),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(
                      snapshot.data!.COOKRCP02.row.elementAt(index).RCPNM,
                      style: TextStyle(
                          fontSize: displayHeight * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("재료"),
                    Text(snapshot.data!.COOKRCP02.row
                        .elementAt(index)
                        .RCPPARTSDTLS),
                    Text("조리순서"),
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
        return CircularProgressIndicator();
      },
    );
  }
}
