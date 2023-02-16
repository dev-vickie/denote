import 'dart:io';

import 'package:denote/firebase_service/firestore_service.dart';
import 'package:file_picker/file_picker.dart';
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

  static Future uploadFile({
    required String? unitName,
    required String? course,
    required String? semester,
    required PlatformFile? pickedFile,
  }) async {
    final path = 'notes/$course/$semester/$unitName/${pickedFile?.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(file);
  }
}
