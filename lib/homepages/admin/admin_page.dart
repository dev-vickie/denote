import 'package:denote/constants/constants.dart';
import 'package:denote/homepages/first_page/widgets/doc_item.dart';
import 'package:denote/widgets/custom_textfield.dart';
import 'package:denote/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        elevation: 0,
        title: const Text("Add unit"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              CustomTextField(
                hidePassword: false,
                icon: Icons.text_format,
                hintText: "Unit Name",
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: kMainDarkColor),
                onPressed: () {},
                child: const Text("Select files"),
              ),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DocItem(
                      docName: "Doc 1",
                    ),
                    DocItem(
                      docName: "Doc 1",
                    ),
                    DocItem(
                      docName: "Doc 1",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SubmitButton(buttonText: "Add unit")
            ],
          ),
        ),
      ),
    );
  }
}
