import 'package:denote/constants/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../firebase_service/firestore_service.dart';
import '../../firebase_service/storage_service.dart';
import '../first_page/first_page.dart';
import '../units/units_page.dart';
import '../third_page/third_page.dart';
import 'widgets/appbar.dart';
import 'widgets/drawer.dart';

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

  @override
  void initState() {
    getCategories();
    getUserData();
    super.initState();
  }

  List<String>? categories; //Empty list to store categories
  Map<String, String>? userData;

  void getCategories() async {
    //load all categories on start
    var loadedCategories = await Fbstorage.loadUnits();
    setState(() {
      categories = loadedCategories;
    });
  }

  void getUserData() async {
    //load all categories on start
    var loadedUserData = await Fbfirestore.getUserData();
    setState(() {
      userData = loadedUserData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> secondPages = [
      FirstPage(
        categories: categories,
        userData: userData,
      ),
      SecondPage(
        categories: categories,
        userData: userData,
      ),
      const ThirdPage(),
    ];
    return Scaffold(
      //AppBar
      appBar: const BuildAppBar(),
      //App Drawer
      drawer: buildAppDrawer(userData),
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
