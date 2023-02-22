import 'package:denote/constants/constants.dart';
import 'package:denote/firebase_service/download_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocItem extends StatelessWidget {
  final doc;
  final String? docName;
  const DocItem({
    required this.docName,
    required this.doc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        Download.openFile(doc).then(
          (value) => Navigator.pop(context),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          width: 190,
          decoration: BoxDecoration(
            color: kMainLightColor,
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
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/book.svg",
                      semanticsLabel: "Document",
                      fit: BoxFit.fitHeight,
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
