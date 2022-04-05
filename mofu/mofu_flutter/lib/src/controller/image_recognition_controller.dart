import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageRecognitionController extends GetxController {
  File? _image;
  double? _imageWidth, _imageHeight;
  List? _recognitions;
  bool? _busy;
  final picker = ImagePicker();

  void ImageSize(ImageInfo info) {
            _imageWidth = info.image.width.toDouble();
            _imageHeight = info.image.height.toDouble();
  }
  
  void Recognitions(List recognitions) {
      _recognitions = recognitions;
  }

  void Busy(bool busy) {
      _busy = true;
  }

  void PickFile(pick){
      if(pick != null) {
        _image = File(pick.path);
      } else {
        print("No image Selected");
      }
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
