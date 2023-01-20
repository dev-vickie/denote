import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

//-----AppBar
var mainAppBar = AppBar(
  backgroundColor: kMainDarkColor,
  title: const Text(
    'Denote',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  centerTitle: true,
  shadowColor: kMainDarkColor,
  leading: Builder(builder: (context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(Icons.menu_book),
    );
  }),
);

//----AppDrawer

var mainAppDrawer = Drawer(
  backgroundColor: kMainDarkColor,
  child: Column(
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
        title: Text(
          'Home',
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
