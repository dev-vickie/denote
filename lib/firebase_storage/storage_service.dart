import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;

class Storage {
  static Future<ListResult> listAll() async {
    ListResult results = await storage.ref("notes").listAll();
    for (var item in results.items) {
      print("found item $item");
    }

    return results;
  }
}
