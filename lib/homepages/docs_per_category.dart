import 'package:denote/constants/constants.dart';
import 'package:flutter/material.dart';

class DocumentsInEachCategoy extends StatelessWidget {
  final String categoryName;
  const DocumentsInEachCategoy({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding, vertical: 2),
            child: ListTile(
              tileColor: Colors.grey[200],
              leading: CircleAvatar(
                backgroundColor: kMainDarkColor,
                child: const Icon(
                  Icons.menu_book_rounded,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
