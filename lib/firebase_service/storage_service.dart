import 'package:denote/firebase_service/firestore_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;

class Fbstorage {
  static Future<List<String>> listAllUnits({
    required String? course,
    required String? semester,
  }) async {
    final List<String> unitFinal = [];
    final units = await storage.ref("notes/$course/$semester").listAll();
    for (var item in units.prefixes) {
      unitFinal.add(item.name);
    }
    return unitFinal;
  }

  static Future<ListResult> listAllDocs({
    required String? course,
    required String? semester,
    required String? unitName,
  }) async {
    final results =
        await storage.ref("notes/$course/$semester/$unitName").listAll();
    return results;
  }

  static Future<List<String>?> loadUnits() async {
    Map<String, String>? userData = await Fbfirestore.getUserData();

    if (userData != null) {
      List<String>? unitNames = await Fbstorage.listAllUnits(
          course: userData["course"], semester: userData["semester"]);

      return unitNames;
    }
    return null;
  }
}
