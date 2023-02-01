import 'package:flutter/material.dart';

import '../../../auth/firebase_service/firebase_auth.dart';
import '../../../constants/constants.dart';

Widget buildAppDrawer() {
  return Drawer(
    backgroundColor: kMainDarkColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        DrawerHeader(
          child: Center(
              child: Text(
            'APP LOGO',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )),
        ),
        ListTile(
          onTap: AuthService.signOut,
          title: Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.home,
            size: 20,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
