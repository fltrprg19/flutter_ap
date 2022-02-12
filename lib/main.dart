import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/notif.dart';
import 'package:flutter_app1/screens/sign_in_screen.dart';
import 'package:flutter_app1/theme.dart';
import 'package:flutter_app1/widgets/rout.dart';
import 'package:provider/provider.dart';

import 'db/authlogic.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyC_fPcwQNozbTU1-06H3fDS0PayuyRVs_I',
      appId: "1:82181190455:android:9a0fe8a116c7b76dd760b2",
      messagingSenderId: "82181190455",
      projectId: "negger",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        home: Mainpage(),
        theme: theme(),
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Sui();
          } else {
            return SignInscreen();
          }
        },
      ),
    );
  }
}
