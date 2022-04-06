import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/home_view/ingredient_add_page.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/controller/shelf_life_index_controller.dart';

class HomePage extends StatelessWidget {
  final shelfLifeIndexController = Get.put(ShelfLifeIndexController(), permanent: false);
  final List<String> entries = <String>['스팸 김치 볶음밥', '스팸 김치찌개'];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: mainColor,
        child: SafeArea(
            bottom: false,
            child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: false,
                title: Text('우리집 냉장고',style: TextStyle(color: Colors.black),),
                centerTitle: true,
                backgroundColor: Colors.white,
              ),
              body:SingleChildScrollView(child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(child: Image.asset('assets/images/banners/temp.png'),),
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
                  Column(
                    children: [
                      Container(
                        width: displayWidth * 0.8,
                        child: Text(
                          'Order by : life',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight * 0.01),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                      Container(
                      width: displayWidth * 0.8,
                          padding:
                              EdgeInsets.only(bottom: displayHeight * 0.005,top: displayHeight * 0.01),
                          child: Obx(()=>ToggleButtons(
                            constraints: BoxConstraints(maxHeight: 20),
                              borderRadius: BorderRadius.circular(20),
                              borderWidth: 2,
                              borderColor: mainColor,
                              selectedBorderColor: mainColor,
                              color: mainColor,
                              hoverColor: mainColor,
                              selectedColor: Colors.white,
                              focusColor: mainColor,
                              fillColor: mainColor,
                              disabledColor: mainColor,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: displayHeight * 0.01),
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Text('All')),
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                  children: [
                                    Image.asset(
                                  "assets/images/icons/expiration_icon/good_1.png",
                                  height: 15,
                                  width: 15,
                                ),
                                Padding(padding: EdgeInsets.only(right: 5))
                                    ,Text('5 items')],
                                )),
                               Container(child: Row(
                                  children: [
                                Padding(padding: EdgeInsets.only(right: 10)),
                                    
                                    Image.asset(
                                  "assets/images/icons/expiration_icon/fridged_1.png",
                                  height: 15,
                                  width: 15,
                                ),
                                Padding(padding: EdgeInsets.only(right: 5))
                                    
                                    ,Text('2 items'),
                                    
                                Padding(padding: EdgeInsets.only(right: 10)),],
                                )),
                                Container(child: Row(
                                  children: [
                                Padding(padding: EdgeInsets.only(right: 10)),
                                    Image.asset(
                                  "assets/images/icons/expiration_icon/danger_1.png",
                                  height: 15,
                                  width: 15,
                                ),
                                Padding(padding: EdgeInsets.only(right: 5)),
                                    Text('5 items'),
                                    
                                Padding(padding: EdgeInsets.only(right: 10)),],
                                )),
                              ],
                              onPressed: (int index) {
                                shelfLifeIndexController.changeTabIndex(index);
                              },
                              isSelected: shelfLifeIndexController.isSelected.toList())),
                        ),
                      Container(
                        height: 2,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(
                            left: displayWidth * 0.02,
                            right: displayWidth * 0.02),
                        padding: EdgeInsets.only(top: displayHeight * 0.01),
                        height: displayHeight * 0.2,
                        child: GridView.builder(
                            itemCount: 15,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: displayWidth * 0.02,
                                    mainAxisSpacing: displayHeight * 0.02),
                            itemBuilder: (BuildContext context, int index) {
                              return InkResponse(
                                  onTap: () {
                                    if (index == 14) {
                                      print('last item selected');
                                      {
                                        Get.to(() => IngredientAddPage(),
                                            transition: Transition.cupertino);
                                      }
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: subColor,
                                          border: Border.all(
                                              color: mainColor, width: 2),
                                        ),
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/images/icons/ingredient_icon/bacon.png'),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.bottomRight,
                                          child: const Image(
                                              image: AssetImage(
                                                  'assets/images/icons/expiration_icon/fridged.png')))
                                    ],
                                  ));
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: displayHeight * 0.03),
                        height: 1,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: displayHeight * 0.05,bottom: displayHeight * 0.02),
                        child: Text(
                          '레시피 즐겨찾기',
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
                                      Text(' ${entries[index]} ')
                                    ]));
                              }))
                    ],
                  ),
                ],
              ),
            )))));
  }
}
