import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../docs_per_category.dart';

class CategoryTexts extends StatelessWidget {
  final List<String>? categories;

  final dynamic index;

  final Map<String, String>? userData;
  const CategoryTexts({
    Key? key,
    required this.categories,
    required this.index,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            categories?[index] ?? "", //Name of the category
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: kMainDarkColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DocumentsInEachCategoy(
                userData: userData,
                categoryName: categories?[index] ?? "",
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              'view all',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
