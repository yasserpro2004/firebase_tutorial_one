import 'package:flutter/material.dart';

void main() {
   runApp(
     MaterialApp(
       title: 'demo',
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       debugShowCheckedModeBanner: false,
       home: const MyApp(),
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
          child:  Text('Hello World'),
        ),
      );
   }
}