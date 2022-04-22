import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';

class Authentication extends ChangeNotifier {
  late String? uid;
  String? get getUid => uid;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future loginAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    uid = user?.uid;
    // print('This is uid => $getUid');
    notifyListeners();
  }

  Future createAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    uid = user?.uid;
    // print('This is uid => $getUid');
    notifyListeners();
  }
}
