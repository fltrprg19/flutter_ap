import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/pro1.dart';

import 'package:flutter_svg/svg.dart';



import '../constants.dart';

class Bodpro extends StatelessWidget {
  const Bodpro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          profilpor(),
          SizedBox(
            height: 20,
          ),
          fatbut(
            icon: 'assets/icons/User Icon.svg',
            press: () {},
            text: 'حسابي',
          ),
          fatbut(
            icon: 'assets/icons/Bell.svg',
            press: () {},
            text: 'اشعارات عن اخر التحديثات',
          ),
          fatbut(
            icon: 'assets/icons/Settings.svg',
            press: () {},
            text: 'الاعدادات',
          ),
          fatbut(
            icon: 'assets/icons/Question mark.svg',
            press: () {},
            text: 'كيفية الاستخدام',
          ),
          fatbut(
            icon: 'assets/icons/Log out.svg',
            press: () {},
            text: 'تسجيل الخروج',
          ),
        ],
      ),
    );
  }
}

class fatbut extends StatelessWidget {
  const fatbut({
    required this.text,
    required this.icon,
    required this.press,
    Key? key,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(
          0xFFF5F6F9,
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: kPrimaryColor,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
