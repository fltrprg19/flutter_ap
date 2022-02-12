import 'package:flutter/material.dart';
import 'package:flutter_app1/help/enum.dart';
import 'package:flutter_app1/widgets/naveg.dart';


import 'bdpro.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static String routname = '/prof-il';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حسابك", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: Container(),
      ),
      body: Bodpro(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
