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
          title: const Text(
            'Denote',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          shadowColor: kMainDarkColor,
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
          actions: const [Icon(Icons.notifications)],
        ),
        // const SizedBox(height: 10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Text(
        //       "Bsc Civil",
        //       style: TextStyle(fontSize: 18, color: kMainDarkColor),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
