import 'package:denote/auth/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Easy access',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
