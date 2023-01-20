import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Column(
        children: const [
          // CustomTextField(
          //   hidePassword: false,
          //   icon: Icons.note_outlined,
          //   hintText: "Unit name",
          // ),
          // const SizedBox(height: 15),

          // CustomTextField(
          //   hidePassword: false,
          //   icon: Icons.note_outlined,
          //   hintText: "Unit code",
          // ),
          // const SizedBox(height: 15),

          // CustomTextField(
          //   hidePassword: false,
          //   icon: Icons.person_outline_rounded,
          //   hintText: "Lecturer",
          // ),
          // const SizedBox(height: 20),

          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: MaterialButton(
          //     color: kMainLightColor,
          //     child: const Text(
          //       "Select file(s)",
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),

          // GestureDetector(
          //   onTap: () {},
          //   child: const SubmitButton(buttonText: "Confirm and upload"),
          // ),
        ],
      ),
    );
  }
}
