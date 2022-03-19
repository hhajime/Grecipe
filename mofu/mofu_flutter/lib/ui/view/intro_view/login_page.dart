import 'package:flutter/material.dart';
import 'package:mofu_flutter/ui/view/home_view/home_page.dart';
import 'package:mofu_flutter/ui/view/intro_view/signin_page.dart';
import 'package:mofu_flutter/ui/widget/login_textfield.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const EmptyAppBar(),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Expanded(
              child: Center(
                  child: Image(
            image: AssetImage('assets/images/logo/logo.png'),
            height: 170,
          ))),
          Expanded(
              child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: loginTextField(_emailController, 'Email', false)),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: loginTextField(_passwordController, 'Password', true)),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Container(
                  padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                  child: TextButton(
                      onPressed: () {
                        Get.to( const HomePage());
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Color(0xffFFBA7D),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))),
              Container(
                child: const Text('Sign in with', style: TextStyle(color: Colors.black26)),
                color: const Color(0xffFFFFFF).withOpacity(0.5),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/images/logo/facebook.png'),
                    height: 70,
                  ),
                  Image(
                    image: AssetImage('assets/images/logo/google.png'),
                    height: 70,
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have an account?', style: TextStyle(color: Colors.black26),),
                  const Padding(padding: EdgeInsets.all(10)),
                  TextButton(
                      onPressed: () {
                        Get.to( const SigninPage());
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Color(0xffFFBA7D),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10))
            ],
          ))
        ])));
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFBA7D),
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
