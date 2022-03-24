import 'package:flutter/material.dart';

class Group140Widget extends StatefulWidget {
  @override
  _Group140WidgetState createState() => _Group140WidgetState();
}

class _Group140WidgetState extends State<Group140Widget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group140Widget - GROUP

    return Container(
        width: 409,
        height: 165,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 409,
                  height: 165,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 231, 219, 1),
                  ))),
          Positioned(
              top: 23,
              left: 226,
              child: Text(
                '레시피에 \n 관한 유용한 \n 정보를 얻는 방법',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(56, 56, 56, 1),
                    fontFamily: 'Arial',
                    fontSize: 22,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 114,
              left: 229,
              child: Container(
                  width: 142,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
              top: 119,
              left: 323,
              child: Container(
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/icon/Eyes1.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 122,
              left: 248,
              child: Text(
                '알아보기',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(66, 66, 66, 1),
                    fontFamily: 'Arial',
                    fontSize: 18,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 20,
              left: 27,
              child: Container(
                  width: 167,
                  height: 128,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/icon/Image26.png'),
                        fit: BoxFit.fitWidth),
                  ))),
        ]));
  }
}
