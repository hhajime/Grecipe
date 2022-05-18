import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:image_picker/image_picker.dart';

class CommunityRecipeAddPage extends StatelessWidget {
  const CommunityRecipeAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black12,
        stretch: true,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
            title: const Text('탭하여 이미지 추가하기'),
            background: _image == null
                ? Text('No image Selected')
                : Image.file(File(_image!.path))),
      ),
      SliverList(
          delegate: SliverChildListDelegate(
        [
          Container(
            height: 500,
            color: Colors.white,
          ),
          Container(
            height: 500,
            color: Colors.red,
          )
        ],
      ))
    ]));
  }

  Future getImageFromGallary() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
