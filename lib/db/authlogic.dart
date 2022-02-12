import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  Future<void> login(String email, String password) async {
    UserCredential authresult;

    try {
      authresult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      notifyListeners();

      FirebaseFirestore.instance
          .collection('users')
          .doc(authresult.user!.uid)
          .set({
        "email": email,
        "password": password,
      });
    } catch (e) {
      print(e);
    }
  }
}
