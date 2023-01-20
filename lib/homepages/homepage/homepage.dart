import 'package:denote/constants/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import '../first_page/first_page.dart';
import '../second_page/second_page.dart';
import '../third_page/third_page.dart';
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

      bottomNavigationBar: Container(
        color: kMainDarkColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            padding: const EdgeInsets.all(16),
            backgroundColor: kMainDarkColor,
            tabBackgroundColor: kMainLightColor,
            color: kMainLightColor,
            activeColor: Colors.white,
            gap: 8.0,
            selectedIndex: selectedPage,
            onTabChange: (value) {
              pageNavigator(value);
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.mediation_rounded,
                text: "Units",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
