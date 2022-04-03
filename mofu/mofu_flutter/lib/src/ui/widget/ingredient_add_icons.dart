import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/data/list.dart';

void ingredientAddIconsDialog(){
  Get.dialog(
    Dialog( shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))
                ),
      //title: Text('아이콘으로 등록하기', style: TextStyle(fontSize: displayHeight * 0.03, color: mainColor, fontWeight: FontWeight.bold),),
      child: SingleChildScrollView(
        child: Container(
          width: displayWidth * 0.8,
          height: displayHeight * 0.6,
          child:Column(
          children: [
            Container(
              height: 30,
              color: Colors.amber,
            ),
            
            Container(
              height: 30,
              color: Colors.black,
            ),
            
            Container(
              height: 30,
              color: Colors.amber,
            )
          ],
        ),
      ),
    ))
  );
}