import 'package:flutter/material.dart';

import 'body3.dart';


class Login6 extends StatelessWidget {
  const Login6({Key? key}) : super(key: key);
  static String routname = '/login-6';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "اكتمل تسجيل الدخول",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body3(),
    );
  }
}
