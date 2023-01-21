import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    this.controller,
    this.validator,
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
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
        ),
        icon: Icon(
          widget.icon,
          size: 26,
        ),
      ),
    );
  }
}
