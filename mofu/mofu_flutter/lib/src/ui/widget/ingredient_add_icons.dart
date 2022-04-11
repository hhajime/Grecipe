import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/widget/landing_page.dart';

void ingredientAddIconsDialog() {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return mainColor;
  }

  Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: mainColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(40.0))),
      //title: Text('아이콘으로 등록하기', style: TextStyle(fontSize: displayHeight * 0.03, color: mainColor, fontWeight: FontWeight.bold),),
      child: SingleChildScrollView(
        child: Container(
          width: displayWidth * 0.8,
          height: displayHeight * 0.6,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                height: displayHeight * 0.07,
                child: Center(
                  child: Text(
                    '아이콘으로 등록하기',
                    style: TextStyle(
                      fontSize: displayHeight * 0.02,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  height: displayHeight * 0.4,
                  child: ListView(
                    children: [
                      ExpansionTile(
                        textColor: mainColor,
                        title: Text('채소'),
                      ),
                      ExpansionTile(
                        title: Text('과일·견과·쌀'),
                      ),
                      ExpansionTile(
                        title: Text('수산·해산·건어물'),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      ExpansionTile(
                        title: Text('정육·계란'),
                      ),
                      ExpansionTile(
                        title: Text('면·양념·오일'),
                      ),
                    ],
                  )),
              Container(
                child: Center(
                  child: Container(
                    height: displayHeight * 0.05,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(mainColor),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.resolveWith(getColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: mainColor, width: 2))),
                      ),
                      child: Text(
                        '확인',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: displayHeight * 0.025),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )));
}
