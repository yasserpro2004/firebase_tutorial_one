import 'package:firebase_tutorial_one/screens/screens.dart';
import 'package:firebase_tutorial_one/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      default:
        return _errRoute();
    }
  }

  static Route _errRoute() => MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => const Scaffold(appBar: CustomAppBar(title: 'error')),
      );
}
