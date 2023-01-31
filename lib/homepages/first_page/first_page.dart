import 'package:denote/firebase_storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'widgets/category_text.dart';
import 'widgets/doc_item.dart';

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
          //return this for each course category
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
                    //custom widget to display category name
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
                        return const DocItem(); //each document item in a category
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
