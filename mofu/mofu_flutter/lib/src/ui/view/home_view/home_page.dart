import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/home_view/ingredient_add_page.dart';
import 'package:mofu_flutter/src/ui/view/home_view/ingredient_modify_page.dart';
import 'package:mofu_flutter/src/ui/view/home_view/recipe_page.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/controller/shelf_life_index_controller.dart';
import 'package:mofu_flutter/src/controller/mytabcontroller.dart';

class HomePage extends StatelessWidget {
  final shelfLifeIndexController =
      Get.put(ShelfLifeIndexController(), permanent: false);
  final MyTabController _tabx = Get.put(MyTabController());
  final List<String> entries = <String>['스팸 김치 볶음밥', '스팸 김치찌개'];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: mainColor,
        child: SafeArea(
            bottom: false,
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    '우리집 냉장고',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                ),
                body: SingleChildScrollView(
                    child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset('assets/images/banners/temp.png'),
                      ),
                      SizedBox(
                        height: displayHeight * 0.06,
                        child: Container(
                          width: displayWidth * 0.8,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '등록된 재료 목록',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: displayHeight * 0.02),
                          ),
                        ),
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        child: Text(
                          'Sort by : life',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight * 0.01),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        height: displayHeight * 0.018,
                        child: Container(
                            width: displayWidth * 0.6,
                            child: TabBar(
                                unselectedLabelColor: mainColor,
                                labelPadding:
                                    EdgeInsets.only(left: 5, right: 5),
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: mainColor),
                                indicatorSize: TabBarIndicatorSize.label,
                                isScrollable: false,
                                controller: _tabx.controller,
                                tabs: _tabx.myTabs)),
                        alignment: Alignment.bottomLeft,
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        height: 2,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      SizedBox(
                          width: displayWidth * 0.8,
                          height: displayHeight * 0.2,
                          child: TabBarView(
                              controller: _tabx.controller,
                              children: [
                                ingGridContainer('good'),
                                ingGridContainer('good'),
                                ingGridContainer('fridged'),
                                ingGridContainer('danger'),
                              ])),
                      Container(
                        margin: EdgeInsets.only(top: displayHeight * 0.03),
                        height: 1,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            top: displayHeight * 0.05,
                            bottom: displayHeight * 0.02),
                        child: Text(
                          '가능한 레시피 목록',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight * 0.02),
                        ),
                      ),
                      Container(
                          width: displayWidth * 0.8,
                          height: displayHeight * 0.2,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: entries.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    width: displayWidth * 0.1,
                                    height: displayHeight * 0.05,
                                    margin: EdgeInsets.only(
                                        bottom: displayHeight * 0.01),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      color: subColor,
                                      border: Border.all(
                                          color: mainColor, width: 2),
                                    ),
                                    child: Row(children: [
                                      Text(' ${entries[index]} '),
                                      Container(
                                          child: Row(children: [
                                        AvailRecipeIcons('kimchi'),
                                        AvailRecipeIcons('rice'),
                                        AvailRecipeIcons('onion'),
                                        AvailRecipeIcons('green_onion'),
                                        AvailRecipeIcons('sausage')
                                      ])),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          Get.to(() => RecipePage(),
                                              transition: Transition.cupertino);
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_rounded,
                                          color: mainColor,
                                        ),
                                      )
                                    ]));
                              }))
                    ],
                  ),
                )))));
  }

  Condicon(index, life) {
    if (index < ingResult.length) {
      return Column(children: [
        Stack(
          children: [
            Container(
              height: displayHeight * 0.066,
              width: displayWidth * 0.16,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: subColor,
                border: Border.all(color: mainColor, width: 2),
              ),
              child: Image(
                image: AssetImage(
                    'assets/images/icons/ingredient_icon/${ingResult[index]}.png'),
              ),
            ),
            Container(
                height: displayHeight * 0.066,
                color: Colors.transparent,
                alignment: Alignment.bottomRight,
                child: Image(
                    image: AssetImage(
                        'assets/images/icons/expiration_icon/${life}.png')))
          ],
        ),
        Container(
            child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(ingResult[index]),
        ))
      ]);
    }
    return Container(
      height: displayHeight * 0.066,
      width: displayWidth * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: subColor,
        border: Border.all(color: mainColor, width: 2),
      ),
      child: Icon(
        Icons.add,
        color: mainColor,
      ),
    );
  }

  ingGridContainer(life) {
    return Container(
      width: displayWidth * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
          left: displayWidth * 0.02, right: displayWidth * 0.02),
      padding: EdgeInsets.only(top: displayHeight * 0.01),
      height: displayHeight * 0.2,
      child: GridView.builder(
          itemCount: ingResult.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: displayWidth * 0.02,
              mainAxisExtent: displayHeight * 0.09,
              mainAxisSpacing: displayHeight * 0.02),
          itemBuilder: (BuildContext context, int index) {
            return InkResponse(
              onTap: () {
                if (index < ingResult.length) {
                  print('item selected');
                  {
                    Get.to(() => IngredientModifyPage(),
                        transition: Transition.cupertino);
                  }
                } else if (index == ingResult.length) {
                  print('last item selected');
                  {
                    Get.to(() => IngredientAddPage(),
                        transition: Transition.cupertino);
                  }
                }
              },
              child: Condicon(index, life),
            );
          }),
    );
  }

  AvailRecipeIcons(ingredients) {
    return Image.asset(
      "assets/images/icons/ingredient_icon/${ingredients}.png",
      height: 15,
      width: 15,
    );
  }
}
