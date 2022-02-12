import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/formerror.dart';
import 'package:flutter_app1/widgets/suf.dart';


import '../constants.dart';

import '../size.dart';
import 'defualtbutton.dart';
import 'noWidgets.dart';

class Bodyf extends StatelessWidget {
  const Bodyf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Text(
                "نسيان كلمة المرور",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "رجاء ادخال ايميلك ونحن سوف نرسل لك رابط لاستعادة حسابك",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
              ),
              Forgotpasswordform(),
            ],
          ),
        ),
      ),
    );
  }
}

class Forgotpasswordform extends StatefulWidget {
  const Forgotpasswordform({Key? key}) : super(key: key);

  @override
  _ForgotpasswordformState createState() => _ForgotpasswordformState();
}

class _ForgotpasswordformState extends State<Forgotpasswordform> {
  List<String> errors = [];
  String email = '';
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) {
              setState(() {
                email = value!;
              });
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: (v) {
              if (v.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(v) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              label: Text("ايميل"),
              hintText: "ادخل ايميلك",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(
                svgIcon: 'assets/icons/Mail.svg',
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormErorr(
            errors: errors,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          DefaultButton(
            text: "اكمل",
            press: () {
              if (_key.currentState!.validate()) {}
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
        ],
      ),
    );
  }
}
