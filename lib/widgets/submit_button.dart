import 'package:flutter/material.dart';
import '../constants/constants.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  const SubmitButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kMainDarkColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
