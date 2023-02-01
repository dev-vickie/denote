import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../firebase_storage/storage_service.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      actions: [
        IconButton(
          onPressed: () {
            //TODO: fetch from reg page
            Fbstorage.listAllUnits(unitName: "bscmechanical", semester: "4.2");
          },
          icon: const Icon(Icons.list),
        )
      ],
    );
  }
}
