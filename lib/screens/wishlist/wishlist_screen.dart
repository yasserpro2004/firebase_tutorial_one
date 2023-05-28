import 'package:firebase_tutorial_one/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  static const String routeName = '/wishlist';

  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const WishListScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'WishList', showFavIcon: false),
      bottomNavigationBar: const CustomNavigationBar(routeName: routeName),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: ProductModel.products.length,
          itemBuilder: ((context, index) {
            return Center(
              child: WishlistProductCard(
                product: ProductModel.products[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
