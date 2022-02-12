
import 'package:date_picker_timeline/date_picker_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app1/db/stream.dart';
import 'package:flutter_app1/help/enum.dart';
import 'package:flutter_app1/widgets/button.dart';
import 'package:flutter_app1/widgets/naveg.dart';
import 'package:flutter_app1/widgets/pro1.dart';
import 'package:flutter_app1/widgets/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


import '../constants.dart';
import '../size.dart';
import 'Addtaskpage.dart';

class Sui extends StatefulWidget {
  const Sui({Key? key}) : super(key: key);
  static String routname = '/sui';

  @override
  _SuiState createState() => _SuiState();
}

class _SuiState extends State<Sui> {
  var sel = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              profilpor.foto == null
                  ? 'assets/images/person.jpeg'
                  : profilpor.foto,
            ),
            radius: 18,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 10,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: head1,
                    ),
                    Text(
                      "اليوم",
                      style: head2,
                    ),
                  ],
                ),
                MyButton(
                    lable: "ارسل رسالة+",
                    onTap: () {
                      Navigator.of(context).pushNamed(AddTaskPage.routname);
                    }),
              ],
            ),
          ),
          _addDatebar(),
          SizedBox(
            height: getProportionateScreenHeight(6),
          ),
          Stream()
        ],
      ),
    );
  }

  _addtaskbar() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: head1,
              ),
              Text(
                "اليوم",
                style: head2,
              ),
            ],
          ),
          MyButton(
              lable: "ارسل رسالة+",
              onTap: () {
                Navigator.of(context).pushNamed(AddTaskPage.routname);
              }),
        ],
      ),
    );
  }

  _addDatebar() {
    return Container(
      margin: const EdgeInsets.only(top: 6, left: 20),
      child: DatePicker(
        DateTime.now(),
        width: 70,
        initialSelectedDate: DateTime.now(),
        height: 100,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        onDateChange: (newdate) {
          setState(() {
            sel = newdate;
          });
        },
      ),
    );
  }

  _notaskmsg() {
    return Stack(
      children: [
        SingleChildScrollView(
            child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          children: [
            const SizedBox(
              height: 220,
            ),
            SvgPicture.asset(
              'assets/images/task.svg',
              height: 90,
              color: kPrimaryColor.withOpacity(0.5),
              semanticsLabel: "task",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Text(
                "!ليس لديك اي رسالة مرسلة",
                style: head0,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
