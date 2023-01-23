import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  late bool? hidePassword;

  CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.suffixIcon,
    required this.hidePassword,
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
      obscureText: widget.hidePassword!,
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              if (widget.hidePassword == false) {
                widget.hidePassword = true;
              } else {
                widget.hidePassword = false;
              }
            });
          },
          icon: Icon(
            widget.suffixIcon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
