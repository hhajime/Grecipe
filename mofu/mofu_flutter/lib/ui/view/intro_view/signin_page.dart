import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(child: const Image(
          image: AssetImage('assets/images/logo/sign_in_banner.png'),
          height: 70,fit: BoxFit.cover,
        ),),
      ],
    ));
  }
}
