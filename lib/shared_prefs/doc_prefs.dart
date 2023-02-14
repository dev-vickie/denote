import 'package:shared_preferences/shared_preferences.dart';

class DocPreferences {
  static SharedPreferences? _prefs;
  static Future setDocPath({
    required String docName,
    required String path,
  }) async =>
      await _prefs?.setString(docName, path);

  static getDocPath({required String docName}) async =>
      _prefs?.getString(docName);
}
