import 'package:flutter/material.dart';
import 'package:mofu_flutter/data/list.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainColor,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: 'fridge',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'food vision',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'my page',
            icon: Icon(Icons.location_on),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: displayHeight * 0.06,
            child: Center(
              child: Text(
                '우리집 냉장고',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: displayHeight * 0.02),
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: displayHeight * 0.02),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Order by : life',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(right: 15),
                ),
                Container(
                    child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: displayWidth * 0.1),
                      child: CustomRadioButton(
                        wrapAlignment: WrapAlignment.start,
                        defaultSelected: "All",
                        autoWidth: false,
                        width: displayWidth * 0.16,
                        height: displayHeight * 0.03,
                        customShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: mainColor)),
                        enableShape: true,
                        elevation: 0,
                        absoluteZeroSpacing: false,
                        spacing: displayWidth * 0.01,
                        padding: displayHeight * 0.004,
                        selectedBorderColor: mainColor,
                        unSelectedColor: Colors.white,
                        unSelectedBorderColor: mainColor,
                        buttonLables: [
                          'All',
                          'Good',
                          'Fridged',
                          'Danger',
                        ],
                        buttonValues: [
                          'All',
                          "Good",
                          "Fridged",
                          "Danger",
                        ],
                        buttonTextStyle: ButtonTextStyle(
                            selectedColor: Colors.white,
                            unSelectedColor: mainColor,
                            textStyle:
                                TextStyle(fontSize: displayHeight * 0.013)),
                        radioButtonValue: (value) {
                          print(value);
                        },
                        selectedColor: mainColor,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(
                                displayWidth * 0.13, 8, 0, 0),
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/icons/expiration_icon/good.png'))),
                        Container(
                            padding: EdgeInsets.fromLTRB(
                                displayWidth * 0.13, 8, 0, 0),
                            child: Image(
                                image: const AssetImage(
                                    'assets/images/icons/expiration_icon/fridged.png'))),
                        Container(
                          padding:
                              EdgeInsets.fromLTRB(displayWidth * 0.13, 8, 0, 0),
                          child: Image(
                              image: const AssetImage(
                                  'assets/images/icons/expiration_icon/danger.png')),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(
                                displayWidth * 0.13, 8, 0, 0),
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/icons/expiration_icon/good.png'))),
                      ],
                    ),
                  ],
                )),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: mainColor, width: 1),
                        bottom: BorderSide(color: mainColor, width: 1),
                      )),
                  margin: EdgeInsets.only(
                      left: displayWidth * 0.02, right: displayWidth * 0.02),
                  padding: EdgeInsets.only(
                      top: displayHeight * 0.01,
                      left: displayWidth * 0.02,
                      right: displayWidth * 0.02),
                  height: displayHeight * 0.2,
                  child: GridView.builder(
                      itemCount: 31,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: displayWidth * 0.02,
                          mainAxisSpacing: displayHeight * 0.02),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(color: mainColor, width: 2),
                              ),
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/icons/ingredient_icon/bacon.png'),
                              ),
                            ),
                            Container(
                                alignment: Alignment.bottomRight,
                                child: Image(
                                    image: const AssetImage(
                                        'assets/images/icons/expiration_icon/fridged.png')))
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
