import 'package:flutter/material.dart';

class PageText extends StatelessWidget {
  final String pageTitle;
  const PageText({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          pageTitle,
          style: const TextStyle(
            fontSize: 29,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.blue,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(2),
            child: Text(
              "Beta",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
