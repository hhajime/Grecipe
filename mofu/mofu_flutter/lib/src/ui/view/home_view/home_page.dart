import 'package:flutter/material.dart';
import 'package:mofu_flutter/data/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: displayHeight * 0.06,
            child: const Center(
              child: Text(
                '우리집 냉장고',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: displayHeight * 0.06,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: displayWidth * 0.1),
              child: Text(
                '등록된 재료 목록',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
                border: Border(top: BorderSide(color: mainColor, width: 1),bottom: BorderSide(color: mainColor, width: 1),
                    )),
            margin: EdgeInsets.only(
                left: displayWidth * 0.02,
                right: displayWidth * 0.02),
            padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                left: displayWidth * 0.02,
                right: displayWidth * 0.02),
            height: displayHeight * 0.3,
            child: GridView.builder(
                itemCount: 31,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(color: mainColor, width: 2),
                    ),
                    child: Image(image: const AssetImage('assets/images/icons/ingredient_icon/bacon.png'),),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
