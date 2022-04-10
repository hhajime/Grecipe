import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/ui/widget/landing_page.dart';
import 'package:http/http.dart' as http;

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar:  AppBar(
                leading: BackButton(
                  color: mainColor,
                  onPressed: () {
                    Get.to(() => LandingPage(),
                        transition: Transition.cupertino);
                  },
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  '스팸 김치 볶음밥',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),
              ),
            body: SingleChildScrollView(
              child: Column(

              ),
            ),
          ),
        ),
      ),
    );
  }
}