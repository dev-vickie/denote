import 'package:denote/constants/constants.dart';
import 'package:denote/firebase_service/storage_service.dart';
import 'package:denote/homepages/admin/add_document.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DocumentsInEachCategoy extends StatelessWidget {
  final Map<String, String>? userData;
  final String? categoryName;

  const DocumentsInEachCategoy({
    super.key,
    required this.categoryName,
    required this.userData,
  });

  Future downloadDoc(Reference ref) async {
    final url = await ref.getDownloadURL();
    final temporaryDirectory = await getTemporaryDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        title: Text(categoryName!),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => AddDocument(
              //       categoryName: categoryName,
              //     ),
              //   ),
              // );
            },
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
          course: userData?["course"],
          semester: userData?["semester"],
          unitName: categoryName,
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
                    tileColor: Colors.grey[200],
                    title: Text(doc.name),
                    leading: CircleAvatar(
                      backgroundColor: kMainDarkColor,
                      child: const Icon(
                        Icons.menu_book_rounded,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
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
