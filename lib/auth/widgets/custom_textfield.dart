import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  final String hintText;
  final IconData icon;

  CustomTextField({
    super.key,
    this.controller,
    required this.icon,
    required this.hintText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        icon: Icon(
          widget.icon,
          size: 26,
        ),
      ),
    );
  }
}
