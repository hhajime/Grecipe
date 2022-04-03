import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/home_view/ingredient_add_page.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: mainColor,
      child: SafeArea(
        bottom: false,
      child: Container(
        color: Colors.white,
        child: Column(
        children: [
          SizedBox(
            height: displayHeight * 0.06,
            child: Center(
              child: Text(
                '우리집 냉장고',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: displayHeight * 0.02),
              ),
            ),
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
                  child: Stack(
                children: [
                  Container(
                    child: CustomRadioButton(
                      defaultSelected: "All",
                      autoWidth: false,
                      width: displayWidth * 0.17,
                      height: displayHeight * 0.03,
                      customShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: mainColor)),
                      enableShape: true,
                      elevation: 0,
                      absoluteZeroSpacing: false,
                      spacing: displayWidth * 0.01,
                      padding: displayHeight * 0.004,
                      selectedBorderColor: mainColor,
                      unSelectedColor: Colors.white,
                      unSelectedBorderColor: mainColor,
                      buttonLables: [
                        'All',
                        'Good',
                        'Fridged',
                        'Danger',
                      ],
                      buttonValues: [
                        'All',
                        "Good",
                        "Fridged",
                        "Danger",
                      ],
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: mainColor,
                          textStyle: TextStyle(
                              fontSize: displayHeight * 0.013,
                              fontWeight: FontWeight.bold)),
                      radioButtonValue: (value) {
                        print(value);
                      },
                      selectedColor: mainColor,
                    ),
                  ),
                  /** 
                  Row( //left align needed
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              displayWidth*0.13, 8, 0, 0),
                          child: const Image(
                              image: AssetImage(
                                  'assets/images/icons/expiration_icon/good.png'))),
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              0, 8, 0, 0),
                          child: Image(
                              image: const AssetImage(
                                  'assets/images/icons/expiration_icon/fridged.png'))),
                      Container(
                        padding:
                            EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Image(
                            image: const AssetImage(
                                'assets/images/icons/expiration_icon/danger.png')),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              0, 8, 0, 0),
                          child: const Image(
                              image: AssetImage(
                                  'assets/images/icons/expiration_icon/good.png'))),
                    ],
                  ),**/
                ],
              )),
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
                    left: displayWidth * 0.02, right: displayWidth * 0.02),
                padding: EdgeInsets.only(top: displayHeight * 0.01),
                height: displayHeight * 0.2,
                child: GridView.builder(
                    itemCount: 15,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: displayWidth * 0.02,
                        mainAxisSpacing: displayHeight * 0.02),
                    itemBuilder: (BuildContext context, int index) {
                      return 
                      InkResponse(
                        onTap: () {
                          if(index == 14){
                            print('last item selected');
                            {Get.to(()=>IngredientAddPage(), transition: Transition.cupertino);}
                          }
                        },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: subColor,
                              border: Border.all(color: mainColor, width: 2),
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
                padding: EdgeInsets.only(top: displayHeight * 0.05),
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
                            margin:
                                EdgeInsets.only(bottom: displayHeight * 0.01),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: subColor,
                              border: Border.all(color: mainColor, width: 2),
                            ),
                            child: Row(
                                children: [Text(' Recipe ${entries[index]}')]));
                      }))
            ],
          ),
        ],
      ),
    )));
  }
}
