import 'package:denote/constants/constants.dart';
import 'package:flutter/material.dart';
import '../first_page/first_page.dart';
import '../second_page.dart';
import '../third_page.dart';
import 'homepage_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  void pageNavigator(index) {
    setState(() {
      selectedPage = index;
    });
  }

  final List<Widget> secondPages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: mainAppBar,
      //App Drawer
      drawer: mainAppDrawer,
      backgroundColor: Colors.white,
      //List of pages
      body: secondPages[selectedPage],

      //Bottom Nav Bar

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: pageNavigator,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mediation_outlined), label: "Units"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        backgroundColor: kMainDarkColor,
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 3, 9, 44)),
      ),
    );
  }
}
