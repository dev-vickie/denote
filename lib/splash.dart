import 'package:denote/auth/pages/auth_controller.dart';
import 'package:denote/constants/constants.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: kMainDarkColor,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/main-logo.png",
            height: 200,
            width: 200,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
