import 'package:denote/constants/constants.dart';
import 'package:flutter/material.dart';

import '../docs_per_category.dart';

class UnitsPage extends StatelessWidget {
  final List<String>? categories;
  final Map<String, String>? userData;

  const UnitsPage(
      {super.key, required this.categories, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categories != null && categories!.isNotEmpty
          ? GridView.builder(
              itemCount: categories?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DocumentsInEachCategoy(
                          categoryName: categories?[index],
                          userData: userData,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7, top: 13),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kMainLightColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-1.12, -1.12),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 7,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categories?[index] ?? " ",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No units for this course yet.\nContact your classrep for assistance",
              ),
            ),
    );
  }
}
