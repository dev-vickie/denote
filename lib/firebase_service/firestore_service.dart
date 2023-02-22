import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth/firebase_auth/firebase_auth.dart';

class Fbfirestore {
  static Future<Map<String, String>?> getUserData() async {
    String? uid = AuthService.getCurrentUser();
    if (uid != null) {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      if (snapshot.exists) {
        // retrieve the courseName and semester fields from the document
        String course = snapshot.get("course");
        String semester = snapshot.get("semester");
        String usertype = snapshot.get("usertype");
        String email = snapshot.get("email");
        String username = snapshot.get("username");
        // return the values as a map

        return {
          "course": course,
          "semester": semester,
          "usertype": usertype,
          "email": email,
          "username": username,
        };
      } else {
        print("User data not found");
        return null;
      }
    } else {
      print("User is not signed in");
      return null;
    }
  }
}
