import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 0, 7, 20),
      body: Column(
        children: const [
          ListTile(
            title: Text('Account Settings'),
            trailing: Icon(Icons.supervisor_account_outlined),
          ),
          ListTile(
            title: Text('Notification Settings'),
            trailing: Icon(Icons.notifications),
          ),
          ListTile(
            trailing: Icon(Icons.question_mark),
            title: Text('FAQ\'s'),
          ),
          ListTile(
            trailing: Icon(Icons.share),
            title: Text('Share'),
          ),
          ListTile(
            trailing: Icon(Icons.question_mark),
            title: Text('FAQ\'s'),
          ),
          ListTile(
            trailing: Icon(Icons.share),
            title: Text('Share'),
          ),
        ],
      ),
    );
  }
}
