import 'package:firebase_tutorial_one/screens/screens.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  final String routeName;
  const CustomNavigationBar({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: primaryColor,
      child: IconTheme(
        data: const IconThemeData(color: Colors.white, size: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, routeName)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(BuildContext context, String screen) {
    switch (screen) {
      case '/homeScreen':
        return _buildNavbar(context);
      case ProductsByCategory.routeName:
        return _buildNavbar(context);
      default:
    }
    return null;
  }

  List<Widget> _buildNavbar(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(Icons.home, color: Colors.white)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: const Icon(Icons.shopping_cart, color: Colors.white)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
          icon: const Icon(Icons.person, color: Colors.white)),
    ];
  }
}
