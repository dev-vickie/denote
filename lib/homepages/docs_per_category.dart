import 'dart:io';

import 'package:denote/auth/utils/show_error.dart';
import 'package:denote/constants/constants.dart';
import 'package:denote/firebase_service/storage_service.dart';
import 'package:denote/homepages/admin/add_document.dart';
import 'package:denote/homepages/first_page/widgets/doc_item.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../firebase_service/download_doc.dart';
import '../main.dart';

class DocumentsInEachCategoy extends StatefulWidget {
  final Map<String, String>? userData;
  final String? categoryName;

  const DocumentsInEachCategoy({
    super.key,
    required this.categoryName,
    required this.userData,
  });

  @override
  State<DocumentsInEachCategoy> createState() => _DocumentsInEachCategoyState();
}

class _DocumentsInEachCategoyState extends State<DocumentsInEachCategoy> {
  PlatformFile? pickedFile;
  bool isFilePicked = false;

  @override
  Widget build(BuildContext context) {
    final usertype = widget.userData?["usertype"];
    final userCourse = widget.userData?["course"];
    final userSemester = widget.userData?["semester"];
    final unitName = widget.categoryName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        title: Text(unitName!),
        actions: [
          (usertype == "admin")
              ? IconButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowMultiple: false,
                      allowedExtensions: ['pdf'],
                    );
                    if (result == null) {
                      messengerKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text("No file picked"),
                        ),
                      );
                      return;
                    } else {
                      setState(() {
                        pickedFile = result.files.single;
                        isFilePicked = true;
                      });
                      navigatorKey.currentState!.pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SelectedDocPage(
                            pickedFile: pickedFile,
                            userData: widget.userData,
                            unitName: unitName,
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.add,
                      size: 32,
                    ),
                  ),
                )
              : const Offstage(),
        ],
      ),
      body: FutureBuilder(
        future: Fbstorage.listAllDocs(
          course: userCourse,
          semester: userSemester,
          unitName: unitName,
        ),
        builder: (BuildContext context, AsyncSnapshot<ListResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.items.length,
              itemBuilder: (context, index) {
                final doc = snapshot.data!.items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding, vertical: 2),
                  child: ListTile(
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
                    tileColor: Colors.grey[200],
                    title: Text(doc.name),
                    leading: CircleAvatar(
                      backgroundColor: kMainDarkColor,
                      child: const Icon(
                        Icons.menu_book_rounded,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Some error occured"),
            );
          }
        },
      ),
    );
  }
}

class SelectedDocPage extends StatelessWidget {
  final Map<String, String>? userData;
  final PlatformFile? pickedFile;
  final String? unitName;

  const SelectedDocPage(
      {super.key,
      required this.pickedFile,
      required this.userData,
      required this.unitName});

  @override
  Widget build(BuildContext context) {
    final userCourse = userData?["course"];
    final userSemester = userData?["semester"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        title: Text("Add file to $unitName"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userCourse!,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 5),
                Text(
                  userSemester!,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: 300,
              child: DocItem(
                //TODO: doc is untyped
                doc: null,
                docName: pickedFile!.name,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: kMainLightColor,
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                try {
                  await Fbstorage.uploadFile(
                    unitName: unitName,
                    course: userCourse,
                    semester: userSemester,
                    pickedFile: pickedFile,
                  );
                  navigatorKey.currentState!.pop();
                  messengerKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text("Uploaded ${pickedFile?.name}"),
                      backgroundColor: Colors.blue,
                    ),
                  );
                  navigatorKey.currentState!.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => DocumentsInEachCategoy(
                        categoryName: unitName,
                        userData: userData,
                      ),
                    ),
                  );
                } on FirebaseException catch (e) {
                  showErrorMessage(e.code, context);
                }
              },
              child: const Text(
                "Upload",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
