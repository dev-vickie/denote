import 'package:denote/constants/constants.dart';
import 'package:flutter/material.dart';

class AddDocument extends StatefulWidget {
  final String? categoryName;
  const AddDocument({super.key, required this.categoryName});

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        centerTitle: true,
        title: const Text("Add documents"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                widget.categoryName ?? " ",
                style: TextStyle(
                  color: kMainDarkColor,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainLightColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
