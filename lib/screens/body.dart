import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/sign_in_form.dart';
import 'package:flutter_app1/widgets/socil_card.dart';

import '../size.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                Text(
                  "اهلا بعودتك",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " سجل مع حساباتك في التواصل الاجتماعي او\n سجل الدخول مع ايميلك و كلمة مرورك",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    suiiiii(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    suiiiii(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    suiiiii(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
