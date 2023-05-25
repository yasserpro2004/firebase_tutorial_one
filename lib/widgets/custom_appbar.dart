import 'package:flutter/material.dart';

import '../config/constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  //final double barHeight = 50;
  final VoidCallback? favoritOnPress;
  final String title;

  const CustomAppBar({super.key, required this.title, this.favoritOnPress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite,color:Colors.white),
          onPressed: favoritOnPress,
        )
      ],
      title: Center(
        child: Text(title),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
