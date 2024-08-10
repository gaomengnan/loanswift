import 'package:flutter/material.dart';

class BuildMyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BuildMyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      //leading: InkWell(
      //  onTap: () {
      //    Navigator.pop(context);
      //  },
      //  child: const Icon(
      //    IconlyBold.arrowLeftCircle,
      //  ),
      //),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
