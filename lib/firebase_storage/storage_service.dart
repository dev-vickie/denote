import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;

class Fbstorage {
  static Future<List<String>> listAllUnits(
      {required String course, required String semester}) async {
    final List<String> unitFinal = [];
    final units = await storage.ref("notes/$course/$semester").listAll();
    for (var item in units.prefixes) {
      unitFinal.add(item.name);
    }
    return unitFinal;
  }

  static Future<ListResult> listAllDocs(String? unitName) async {
    final results =
        await storage.ref("notes/bscmechanical/4.2/$unitName").listAll();
    return results;
  }
}
