import 'package:flutter/material.dart';

import 'firstpage_widgets.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final List categories = [
      'Transportation Planning',
      'Calculus IV',
      'Theory of Structures III',
      'Hydraulics'
    ];
    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: CategoryTexts(
                      categories: categories,
                      index: index,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const DocItem();
                        },
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
