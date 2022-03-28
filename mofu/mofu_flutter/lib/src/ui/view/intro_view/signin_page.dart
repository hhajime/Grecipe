import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/home_view/home_page.dart';
import 'package:get/get.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(child: Center(
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
              child: Stack(
                children: [
                  Container(
                    child: TextButton(
                        onPressed: () => {},
                        child: Text(
                          '중복확인',
                          style: TextStyle(
                              fontSize: displayHeight * 0.014,
                              fontWeight: FontWeight.bold,
                              color: mainColor),
                        )),
                    alignment: Alignment.bottomRight,
                  ),
                  TextFormField(
                    maxLength: 10,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: mainColor)),
                      hintText: '10자 내외 글자/숫자/특수문자를 입력해주세요',
                      contentPadding: EdgeInsets.only(top: 15),
                      isDense: true,
                      hintStyle: TextStyle(
                          fontSize: displayHeight * 0.013,
                          color: Colors.black38),
                      counterText: '',
                    ),
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: displayWidth * 0.12, right: displayWidth * 0.12),
            ),
            Container(
              child: Text(
                '사용 가능한 닉네임 입니다!',
                style: TextStyle(
                    fontSize: displayHeight * 0.01,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: displayWidth * 0.12, top: displayHeight * 0.01),
            ),
            Container(
              child: Text(
                '이미 존재하는 닉네임 입니다!',
                style: TextStyle(
                    fontSize: displayHeight * 0.01,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: displayWidth * 0.12, top: displayHeight * 0.01),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(
                  right: displayWidth * 0.1,
                  top: displayHeight * 0.35),
              child: ElevatedButton(
                onPressed: () => {Get.to(HomePage(),
          transition: Transition.cupertino)},
                style: ButtonStyle(
                  overlayColor:  MaterialStateProperty.all(mainColor),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.resolveWith(getColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: mainColor, width: 2))),
                ),
                child: Text(
                  '가입완료',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: displayHeight * 0.025),
                ),
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
