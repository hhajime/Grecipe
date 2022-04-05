import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              top: displayHeight * 0.06,
              bottom: displayHeight * 0.06,
              left: displayWidth * 0.05,
              right: displayWidth * 0.05),
          child: Column(
            children: [
              Container(
                  width: displayWidth,
                  height: displayHeight * 0.1,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: displayHeight * 0.05,
                        ),
                      ),
                      Container(
                        child: Text('Developer 님'),
                      ),
                    ],
                  )),
              Container(
                  child: Row(
                children: [
                  Container(
                    child: Text('서비스 알림'),
                  )
                ],
              )),
              Container(
                  child: Row(
                children: [
                  Container(
                    child: Text('마케팅 알림'),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
