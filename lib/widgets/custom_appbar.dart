import 'package:flutter/material.dart';

import '../config/constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  //final double barHeight = 50;
  //final VoidCallback? favoritOnPress;
  final String title;
  final bool showFavIcon;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.showFavIcon = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      actions: [
        showFavIcon
            ? IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushNamed('/wishlist');
                },
              )
            : Container(),
      ],
      title: Text(title),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
