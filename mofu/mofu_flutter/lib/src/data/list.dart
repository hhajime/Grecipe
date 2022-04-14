import 'package:flutter/material.dart';



Color mainColor = const Color(0xffFFBA7D);
Color subColor = const Color(0xffFFFAF5);
Color textfieldColor = const Color(0xffFFEEE0);
Color inactiveColor = const Color(0xFFB88558);
double displayHeight = 0;
double displayWidth = 0;
double displayRatio = 1;

List ingList_vegetable = ['cabbage','carrot','garlic','green_onion','mushroom','onion','pepper','perilla_leaf','pimento','potato','sweet_potato'];//채소
List ingList_fruit = ['corn','rice'];//과일,견과, 쌀
List ingList_fisheries = ['tuna'];//수산, 해산, 건어물
List ingList_meat = ['beef','chicken','egg','pork'];//축산물(정육, 계란)
List ingList_seasoning = ['olive_oil','salt','sugar'];//양념, 오일
List ingList_processedfood = ['bacon','bread','butter','cheese','fish_cake','ham','kimchi','milk','nori','pasta','ramen','sausage'];//면, 가공식품
List ingList_beverage = ['water'];//물

final List<String> ingResult = <String>[
    'kimchi',
    'bacon',
    'onion',
    'rice',
    'salt',
    'pepper',
    'egg',
    'olive_oil',
    'sugar',
    'water'
  ];