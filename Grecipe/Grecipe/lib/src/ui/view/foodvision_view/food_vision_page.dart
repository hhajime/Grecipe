import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grecipe/src/ui/widget/recipe_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:tflite/tflite.dart';

class FoodVision extends StatefulWidget {
  @override
  _FoodVisionState createState() => _FoodVisionState();
}

class _FoodVisionState extends State<FoodVision> {
  File? _image;
  List? _recognitions;
  bool? _busy;
  double? _imageWidth, _imageHeight;
  List<dynamic> recgResult = [];

  final picker = ImagePicker();

  // this function loads the model
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/label.txt",
    );
  }

  // this function detects the objects on the image
  detectObject(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path, // required
        model: "SSDMobileNet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4, // defaults to 0.1
        numResultsPerClass: 10, // defaults to 5
        asynch: true // defaults to true
        );
    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
          setState(() {
            _imageWidth = info.image.width.toDouble();
            _imageHeight = info.image.height.toDouble();
          });
        })));
    setState(() {
      _recognitions = recognitions!;
      recgResult = _recognitions!;
    });
  }

  @override
  void initState() {
    super.initState();
    _busy = true;
    loadTfModel().then((val) {
      {
        setState(() {
          _busy = false;
        });
      }
    });
  }

  // display the bounding boxes over the detected objects
  List<Widget> renderBoxes(Size screen) {
    if (_recognitions == null) return [];
    if (_imageWidth == null || _imageHeight == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight! / _imageHeight! * screen.width;

    Color blue = Colors.blue;

    return _recognitions!.map((re) {
      return Container(
        child: Positioned(
            left: re["rect"]["x"] * factorX * 0.9,
            top: re["rect"]["y"] * factorY * 0.6,
            width: re["rect"]["w"] * factorX * 0.8,
            height: re["rect"]["h"] * factorY * 0.5,
            child: ((re["confidenceInClass"] > 0.50))
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: blue,
                      width: 3,
                    )),
                    child: Text(
                      "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        background: Paint()..color = blue,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )
                : Container()),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
        // using ternary operator
        child: _image == null
            ? Container(
                padding: EdgeInsets.only(top: displayHeight * 0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "아직 촬영한 기록이 없네요!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("촬영하기를 눌러 시작하거나"),
                    Text("저장된 사진을 업로드 해보세요 :)"),
                  ],
                ),
              )
            : // if not null then
            SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: displayHeight * 0.01,
                            bottom: displayHeight * 0.01),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: mainColor, width: 2)),
                        height: displayHeight * 0.25,
                        width: displayWidth * 0.8,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child:
                                    Image(image: Image.file(_image!).image)))),
                    Padding(
                        padding: EdgeInsets.only(top: displayHeight * 0.023)),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(color: mainColor, width: 2)),
                          height: displayHeight * 0.22,
                          width: displayWidth * 0.8,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: displayWidth * 0.02,
                              right: displayWidth * 0.02),
                          margin: EdgeInsets.only(
                              right: displayWidth * 0.4,
                              bottom: displayHeight * 0.23),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(color: mainColor, width: 2)),
                          child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                '${recgResult.length}건의 인식된 재료',
                              )),
                        ),
                        Container(
                          height: displayHeight * 0.2,
                          width: displayWidth * 0.8,
                          padding: EdgeInsets.only(
                              left: displayWidth * 0.03,
                              right: displayWidth * 0.04),
                          child: GridView.builder(
                              itemCount: recgResult.length + 1,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      mainAxisExtent: displayHeight * 0.92,
                                      crossAxisSpacing: displayWidth * 0.02,
                                      mainAxisSpacing: displayHeight * 0.02),
                              itemBuilder: (BuildContext context, int index) {
                                return InkResponse(
                                    onTap: () {
                                      if (index == recgResult.length + 1) {
                                        print('last item selected');
                                        {
                                          //Get.to(() => IngredientAddPage(),
                                          //transition: Transition.cupertino);
                                        }
                                      }
                                    },
                                    child: CondiCon(index));
                              }),
                        ),
                        //Container(child:Text('${recgResult.map((e) => e["detectedClass"])}'))
                      ],
                    ),
                    recipeList()
                  ],
                ),
              )));

    stackChildren.addAll(renderBoxes(size));

    if (_busy!) {
      stackChildren.add(const Center(
        child: CircularProgressIndicator(),
      ));
    }

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: mainColor,
            heroTag: "Fltbtn2",
            child: const Icon(Icons.camera_alt),
            onPressed: getImageFromCamera,
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: mainColor,
            heroTag: "Fltbtn1",
            child: const Icon(Icons.photo),
            onPressed: getImageFromGallery,
          ),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: displayHeight * 0.06,
          child: Center(
            child: Text(
              '푸드 비전',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: displayHeight * 0.02),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Stack(
            children: stackChildren,
          ),
        )
      ]),
    );
  }

  // gets image from camera and runs detectObject
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image Selected");
      }
    });
    detectObject(_image!);
  }

  // gets image from gallery and runs detectObject
  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image Selected");
      }
    });
    detectObject(_image!);
  }

  CondiCon(index) {
    if (index < recgResult.length) {
      return Column(children: [
        Container(
          height: displayHeight * 0.066,
          width: displayWidth * 0.16,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: subColor,
            border: Border.all(color: mainColor, width: 2),
          ),
          child: Image(
            image: AssetImage(
                'assets/images/icons/ingredient_icon/${toKorean(recgResult[index]['detectedClass'])}.png'), //to Korean
          ),
        ),
        Container(
            child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('${recgResult[index]['detectedClass']}'),
        ))
      ]);
    }
    return Column(children: [
      Container(
        height: displayHeight * 0.066,
        width: displayWidth * 0.16,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: subColor,
          border: Border.all(color: mainColor, width: 2),
        ),
        child: Icon(
          Icons.add,
          color: mainColor,
        ),
      ),
      Container(
          child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(' '),
      ))
    ]);
  }
}

toKorean(a) {
  for (int i = 0; i < ingList_en.length; i++) {
    if (a == ingList_en[i]) {
      a = ingList_ko[i];
    }
  }
  return a;
}
