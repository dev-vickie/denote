import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: kMainDarkColor,
          centerTitle: true,
          title: const Text(
            'Denote',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu_book),
              );
            },
          ),
          actions: const [
            Icon(
              Icons.notifications,
              size: 30,
            )
          ],
        ),
      ],
    );
  }
}
