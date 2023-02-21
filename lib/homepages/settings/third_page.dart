import 'package:denote/constants/constants.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final Map<String, String>? userData;

  const ThirdPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final username = userData!["username"];
    final email = userData!["email"];
    final firstLetter = username?.substring(0, 1).toUpperCase();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: kMainLightColor,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: kMainLightColor,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kMainDarkColor,
                        ),
                        child: Center(
                          child: Text(
                            firstLetter ?? "U",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    print(firstLetter);
                  },
                  title: Text('Name'),
                  subtitle: Text(username ?? "user name"),
                  trailing: Icon(Icons.notifications),
                ),
                ListTile(
                  title: Text('Email'),
                  subtitle: Text(email ?? "user email"),
                  trailing: Icon(Icons.supervisor_account_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
