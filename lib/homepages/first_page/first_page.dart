import 'package:denote/firebase_storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'widgets/category_text.dart';
import 'widgets/doc_item.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String>? categories; //Empty list to store categories
  @override
  void initState() {
    super.initState();
    loadUnits(); //load all categories on start
  }

  void loadUnits() async {
    List<String>? unitNames = await Fbstorage.listAllUnits(
        unitName: "bscmechanical", semester: "4.2");

    setState(() {
      categories = unitNames; //Get all units and add to categories list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categories?.length,
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
                      categories: categories,
                      index: index,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureBuilder(
                      future: Fbstorage.listAllDocs(categories?[index]),
                      builder: (context, snapshot) {
                        //TODO: Refine
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                            child: Text("Error"),
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
      ),
    );
  }
}
