import 'dart:async';

import 'package:firebase_tutorial_one/config/constants.dart';
import 'package:firebase_tutorial_one/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  
  static Route route() => MaterialPageRoute(
      settings: const RouteSettings(name: splashRouteName),
      builder: (_) => const SplashScreen());

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      timer.cancel();
    });

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(appLogo),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: const Text(
              appTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]),
      ),
    );
  }
}
