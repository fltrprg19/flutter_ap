import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/Addtaskpage.dart';
import 'package:flutter_app1/screens/forgotpass.dart';
import 'package:flutter_app1/screens/notif.dart';
import 'package:flutter_app1/screens/profile.dart';
import 'package:flutter_app1/screens/rdod.dart';

import 'login6.dart';


final Map<String, WidgetBuilder> routes = {
  Login6.routname: (_) => Login6(),
  Sui.routname: (_) => Sui(),
  AddTaskPage.routname: (_) => AddTaskPage(),
  Forgotscreen.routname: (_) => Forgotscreen(),
  RDE.routname: (_) => RDE(),
  Profile.routname: (_) => Profile(),
};
