import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/bodyf.dart';


class Forgotscreen extends StatelessWidget {
  const Forgotscreen({Key? key}) : super(key: key);
  static String routname = '/forgot-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("نسيت كلمة المرور"),
      ),
      body: Bodyf(),
    );
  }
}
