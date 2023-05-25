import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:firebase_tutorial_one/models/models.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';

  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreen(),
      );

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Zero to unicorn'),
      bottomNavigationBar: const CustomNavigationBar(
        routeName: routeName,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          viewportFraction: 0.9,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: CategoriesModel.categories
            .map((category) => CarouselCard(category: category))
            .toList(),
      ),
    );
  }
}

