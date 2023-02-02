import 'package:denote/firebase_storage/storage_service.dart';
import 'package:flutter/material.dart';
import '../../firebase_storage/firestore_service.dart';
import 'widgets/category_text.dart';
import 'widgets/doc_item.dart';

class FirstPage extends StatefulWidget {
  List<String>? categories; //Empty list to store categories
  Map<String, String>? userData;
  FirstPage({super.key, this.categories, this.userData});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.categories != null
          ? ListView.builder(
              itemCount: widget.categories?.length,
              itemBuilder: (context, index) {
                //return this for each course category
                return SizedBox(
                  height: 200,
                  child: Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          //custom widget to display category name
                          child: CategoryTexts(
                            categories: widget.categories,
                            index: index,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: FutureBuilder(
                            future: Fbstorage.listAllDocs(
                              course: widget.userData?["course"],
                              semester: widget.userData?["semester"],
                              unitName: widget.categories?[index],
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.items.length,
                                  itemBuilder: (context, index) {
                                    return DocItem(
                                      docName: snapshot.data?.items[index].name,
                                    ); //each document item in a category
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    "Error loading data\nContact your classrep if this persists",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No unit uploaded yet.\nContact your classrep for more info",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
    );
  }
}
