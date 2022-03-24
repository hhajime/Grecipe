import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/ui/widget/image_detection.dart';
List<CameraDescription> cameras = [];


class FoodVisionPage extends StatefulWidget {
  const FoodVisionPage({ Key? key }) : super(key: key);

  @override
  State<FoodVisionPage> createState() => _FoodVisionPageState();
}

class _FoodVisionPageState extends State<FoodVisionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Object Detector App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: aboutDialog,
          ),
        ],
      ),
      body: Container(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 170,
                child: RaisedButton(
                  child: Text("Detect in Image"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => StaticImage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  aboutDialog(){
     showAboutDialog(
      context: context,
      applicationName: "Object Detector App",
      applicationLegalese: "By Rupak Karki",
      applicationVersion: "1.0",
      children: <Widget>[
        Text("www.rupakkarki.com.np"),
      ],
    );
  }

}