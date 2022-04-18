import 'package:flutter/material.dart';

Color mainColor = const Color(0xffFFBA7D);
Color subColor = const Color(0xffFFFAF5);
Color textfieldColor = const Color(0xffFFEEE0);
Color inactiveColor = const Color(0xFFB88558);
double displayHeight = 0;
double displayWidth = 0;
double displayRatio = 1;

List ingList_vegetable = [
  'cabbage',
  'carrot',
  'garlic',
  'green_onion',
  'mushroom',
  'onion',
  'pepper',
  'perilla_leaf',
  'pimento',
  'potato',
  'sweet_potato'
]; //채소
List ingList_fruit = ['corn', 'rice']; //과일,견과, 쌀
List ingList_fisheries = ['tuna']; //수산, 해산, 건어물
List ingList_meat = ['beef', 'chicken', 'egg', 'pork']; //축산물(정육, 계란)
List ingList_seasoning = [
  'olive_oil',
  'salt',
  'sugar',
  'soy_sauce',
  'vinegar'
]; //양념, 오일
List ingList_processedfood = [
  'bacon',
  'bread',
  'butter',
  'cheese',
  'fish_cake',
  'ham',
  'kimchi',
  'milk',
  'nori',
  'pasta',
  'ramen',
  'sausage'
]; //면, 가공식품
List ingList_beverage = ['water']; //물

final List<String> ingResult = <String>[
  '김치',
  '베이컨',
  '양파',
  '쌀',
  '고추',
  '달걀',
  '올리브유',
  '물',
  '치즈',
  '소시지',
  '버터',
  '설탕',
  '소금',
  '후추',
  '식초',
  '간장',
];

final List<String> ingList_en = <String>[
  'soy_sauce',
  'potato',
  'sweet_potato',
  'pepper',
  'nori',
  'kimchi',
  'perilla_leaf',
  'egg',
  'chicken',
  'carrot',
  'pork',
  'ramen',
  'garlic',
  'water',
  'mushroom',
  'butter',
  'bacon',
  'bread',
  'sugar',
  'beef',
  'salt',
  'sausage',
  'vinegar',
  'rice',
  'cabbage',
  'onion',
  'fish_cake',
  'corn',
  'olive_oil',
  'milk',
  'tuna',
  'cheese',
  'green_onion',
  'pasta',
  'pimento',
  'ham',
  'black_pepper'
];
final List<String> ingList_ko = <String>[
  '간장',
  '감자',
  '고구마',
  '고추',
  '김',
  '김치',
  '깻잎',
  '달걀',
  '닭고기',
  '당근',
  '돼지고기',
  '라면',
  '마늘',
  '물',
  '버섯',
  '버터',
  '베이컨',
  '빵',
  '설탕',
  '소고기',
  '소금',
  '소시지',
  '식초',
  '쌀',
  '양배추',
  '양파',
  '어묵',
  '옥수수',
  '올리브유',
  '우유',
  '참치',
  '치즈',
  '파',
  '파스타',
  '피망',
  '햄',
  '후추'
];
