import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;

class Storage {
  static Future<List> listAll() async {
    final results = await storage.ref("notes/bsccivil/3.2").listAll();
    final prefs = results.prefixes;
    print(prefs[0].name);

    return prefs;
  }
}
