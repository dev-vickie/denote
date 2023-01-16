import 'package:flutter/material.dart';

class PageText extends StatelessWidget {
  final String pageTitle;
  const PageText({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      pageTitle,
      style: const TextStyle(
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
