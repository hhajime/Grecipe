import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';

class IngredientAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
          child: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: mainColor,
            title: Text(
              '식재료 등록',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          body: Column(
            children: [
              Container(
                  width: displayWidth * 0.8,
                  padding: EdgeInsets.only(top: displayHeight * 0.02),
                  child: Container(
                      height: displayHeight * 0.2,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('이름 입력'),
                              ),
                              Container(
                                child: Container(
                                    width: displayWidth * 0.3,
                                    child: TextFormField(

                                    )),
                              )
                            ],
                          )),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('아이콘으로 등록하기'),
                              ),
                              Container(
                                height: displayHeight * 0.07,
                                width: displayHeight * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(15)),
                                  color: subColor,
                                  border: Border.all(color: mainColor, width: 2),
                                ),
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/icons/ingredient_icon/bacon.png'),
                                ),
                              )
                            ],
                          ))
                        ],
                      ))),
              Container(),
              Container()
            ],
          ),
        ),
      )),
    );
  }
}
