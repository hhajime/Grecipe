import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/ui/view/intro_view/login_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),()=>
      Get.to(LoginPage(),transition: Transition.cupertino)
    );

    return Container(
      color: const Color(0xffFFBA7D),
      child: const Center(
                  child: Image(
            image: AssetImage('assets/images/logo/logo_white.png'),
            height: 170,
          )),
    );
  }
}