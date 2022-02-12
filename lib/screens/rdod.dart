import 'package:flutter/material.dart';
import 'package:flutter_app1/db/stream.dart';
import 'package:flutter_app1/help/enum.dart';
import 'package:flutter_app1/widgets/naveg.dart';


class RDE extends StatefulWidget {
  const RDE({Key? key}) : super(key: key);
  static String routname = '/Rd-e';

  @override
  _RDEState createState() => _RDEState();
}

class _RDEState extends State<RDE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الرسائل",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(
        children: [
          Stream()
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.message,
      ),
    );
  }
}
