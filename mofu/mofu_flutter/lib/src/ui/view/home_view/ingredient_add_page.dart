import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class IngredientAddPage extends StatelessWidget {
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
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  '식재료 등록',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),
              ),
              body: Column(
                children: [
                  Container(
                    height: displayHeight * 0.15,
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
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: textfieldColor,
                                        ),
                                        width: displayWidth * 0.34,
                                        height: displayHeight * 0.06,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '이름을 입력하세요.',
                                          ),
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
                                    height: displayHeight * 0.06,
                                    width: displayHeight * 0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: subColor,
                                      border: Border.all(
                                          color: mainColor, width: 2),
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
                  Container(
                    width: displayWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(child: Text('유통기한 설정')),
                        Container(

                        child: Row(
                          children: [],
                        )

                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        Container(
                          
                        ),
                        Container(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: textfieldColor,
                              ),
                              width: displayWidth * 0.34,
                              height: displayHeight * 0.06,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '내용을 입력하세요.',
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
