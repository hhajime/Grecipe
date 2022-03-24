import 'package:flutter/material.dart';
import 'package:mofu_flutter/data/list.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Container(
              child: Image(
                  image:
                      const AssetImage('assets/images/logo/sign_in_banner.png'),
                  width: displayWidth),
              alignment: Alignment.topCenter,
            ),
            Container(
              child: Text(
                '닉네임을 입력해주세요',
                style: TextStyle(
                    fontSize: displayHeight * 0.02,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: displayWidth * 0.12, top: displayHeight * 0.1),
            ),
            Container(
              child: Text(
                '닉네임',
                style: TextStyle(
                    fontSize: displayHeight * 0.01,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: displayWidth * 0.12, top: displayHeight * 0.03),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '10자 내외 글자/숫자/특수문자를 입력해주세요',
                  hintStyle: TextStyle(
                      fontSize: displayHeight * 0.013, color: Colors.black38),
                ),
              ),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: displayWidth * 0.12,
                  top: displayHeight * 0.01,
                  right: displayWidth * 0.12),
            ),
            Container()
          ],
        ),
      )),
    );
  }
}
