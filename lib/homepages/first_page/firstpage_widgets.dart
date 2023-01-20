import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../docs_per_category.dart';

class DocItem extends StatelessWidget {
  const DocItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 78, 98, 134),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'doc preview',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Doc Name",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 28,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTexts extends StatelessWidget {
  const CategoryTexts({
    Key? key,
    required this.categories,
    required this.index,
  }) : super(key: key);

  final List categories;
  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            categories[index], //Name of the category
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
                categoryName: categories[index],
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
