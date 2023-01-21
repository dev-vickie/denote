import 'package:denote/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static Future<void> signInEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //show success snackbar if account created successfully
      messengerKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Sucess"),
          backgroundColor: Colors.blue,
        ),
      );
      print("done");
      //pop the loading indicator
      navigatorKey.currentState!.pop();
    } on FirebaseAuthException catch (error) {
      //pop the indicator on error
      navigatorKey.currentState!.pop();
      //show the error in the snackbar
      messengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            error.code.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
