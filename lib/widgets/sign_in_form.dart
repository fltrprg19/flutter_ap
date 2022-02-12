import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/db/authlogic.dart';
import 'package:flutter_app1/screens/forgotpass.dart';
import 'package:flutter_app1/screens/formerror.dart';
import 'package:flutter_app1/widgets/suf.dart';
import 'package:provider/provider.dart';


import '../constants.dart';

import '../size.dart';
import 'defualtbutton.dart';
import 'login6.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  var eer = null;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool remember = false;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  var _isLoading = false;
  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    FocusScope.of(context).unfocus();
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).login(email, password);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        eer = 'كلمة المرور قصيرة';
      } else if (error.code == 'email-already-in-use') {
        eer = 'بريد الكترورني خاطئ';
      } else if (error.code == 'user-not-found') {
        eer = 'مستخدم ليس موجود';
      } else if (error.code == 'wrong-password') {
        eer = 'كلمة مرور خاطئة';
      }
      _showerrordilog(eer);
    } catch (e) {
      const error = 'خطا في السيرفر ليس منك';
      print(e);
      _showerrordilog(error);
    }

    setState(() {
      _isLoading = false;
      if (eer == null) {
        Navigator.pushNamed(context, Login6.routname);
      }
    });
  }

  void _showerrordilog(String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('حدث خطا!'),
        content: Text(error),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                eer = null;
              },
              child: Text("حسنا !")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("تذكرني"),
              Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, Forgotscreen.routname),
                child: Text(
                  "نسيت كلمة المرور",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormErorr(
            errors: errors,
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          if (_isLoading)
            CircularProgressIndicator()
          else
            DefaultButton(
              text: "ادخل",
              press: () => _submit(),
            ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 5) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 5) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "كلمة المرور",
        hintText: "ادخل كلمة مرورك",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ايميل",
        hintText: "ادخل ايميلك",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
