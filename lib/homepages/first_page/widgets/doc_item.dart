import 'package:flutter/material.dart';

class DocItem extends StatelessWidget {
  final String? docName;
  const DocItem({
    required this.docName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: 200,
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
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        docName ?? "",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
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
