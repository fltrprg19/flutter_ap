import 'package:flutter/material.dart';

import '../size.dart';
import 'body.dart';

class SignInscreen extends StatelessWidget {
  const SignInscreen({Key? key}) : super(key: key);
  static String routname = '/sign-in';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تسجيل الدخول",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
