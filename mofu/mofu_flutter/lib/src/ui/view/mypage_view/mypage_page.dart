import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';

class MyPage extends StatelessWidget {
  const MyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
        child: Container(
          color: Colors.white,
        ),
      ),
      
    );
  }
}