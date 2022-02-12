import 'package:flutter/material.dart';
import 'package:flutter_app1/help/enum.dart';
import 'package:flutter_app1/screens/notif.dart';
import 'package:flutter_app1/screens/profile.dart';
import 'package:flutter_app1/screens/rdod.dart';
import 'package:flutter_svg/svg.dart';


import '../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            40,
          ),
          topRight: Radius.circular(
            40,
          ),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(
              0xFFDADADA,
            ).withOpacity(
              0.15,
            ),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(Sui.routname),
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(RDE.routname),
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                color: MenuState.message == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Profile.routname),
              icon: SvgPicture.asset("assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor),
            ),
          ],
        ),
      ),
    );
  }
}
