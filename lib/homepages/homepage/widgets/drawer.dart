import 'package:denote/main.dart';
import 'package:flutter/material.dart';
import '../../../auth/firebase_auth/firebase_auth.dart';
import '../../../constants/constants.dart';
import '../../admin/add_unit.dart';

Widget buildAppDrawer(Map<String, String>? userData) {
  return Drawer(
    backgroundColor: kMainDarkColor,
    child: Column(
      children: [
        const DrawerHeader(
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
          onTap: () {
            navigatorKey.currentState!.push(
              MaterialPageRoute(
                builder: (context) => AddUnit(
                  userData: userData,
                ),
              ),
            );
          },
          title: const Text(
            "Admin",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(
            Icons.admin_panel_settings_outlined,
            size: 20,
            color: Colors.white,
          ),
        ),
        const ListTile(
          onTap: AuthService.signOut,
          title: Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.logout_rounded,
            size: 20,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
