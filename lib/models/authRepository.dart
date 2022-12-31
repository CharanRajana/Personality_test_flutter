import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personality_app/extras/helperfunctions.dart';
import 'package:personality_app/extras/widgets.dart';
import 'package:personality_app/models/databaseRepository.dart';

class Authentication {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user!;
      await DatabaseService(uid: user.uid).savingUserData(name, email);
      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  Future signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user!;
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message!);
    }
  }

  Future<void> signOut() async {
    await HelperFunctions.saveUserEmailInStatus("");
    await HelperFunctions.saveUserNameInStatus("");
    await HelperFunctions.saveUserLoggedInStatus(false);
    await auth.signOut();
  }
}
