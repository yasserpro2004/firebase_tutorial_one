import 'package:firebase_tutorial_one/config/app_route.dart';
import 'package:flutter/material.dart';
import 'Package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocs.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlistEvent())),
      ],
      child: MaterialApp(
        title: 'demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        home: const HomeScreen(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
