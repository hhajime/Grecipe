import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/ui/widget/image_detection.dart';
import 'package:mofu_flutter/src/data/list.dart';

List<CameraDescription> cameras = [];

class FoodVisionPage extends StatelessWidget {
  const FoodVisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          SizedBox(
          height: displayHeight * 0.06,
          child: Center(
            child: Text(
              '푸드 비전',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: displayHeight * 0.02),
            ),
          ),
        ),
            ButtonTheme(
              minWidth: 170,
              child: RaisedButton(
                child: Text("객체 인식"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StaticImage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }}