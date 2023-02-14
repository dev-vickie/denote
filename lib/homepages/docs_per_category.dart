import 'dart:io';

import 'package:denote/constants/constants.dart';
import 'package:denote/firebase_service/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        title: Text(widget.categoryName!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.add,
                size: 32,
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: Fbstorage.listAllDocs(
          course: widget.userData?["course"],
          semester: widget.userData?["semester"],
          unitName: widget.categoryName,
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
                      openFile(doc).then(
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

  Future openFile(Reference doc) async {
    final fileName = doc.name;
    final docUrl = await doc.getDownloadURL();
    final file = await downloadFile(docUrl, fileName);
    setState(() {});

    if (file == null) return;
    print('Path: ${file.path}');

    OpenFilex.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}
