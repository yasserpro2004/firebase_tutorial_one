import 'package:flutter/material.dart';

import '../widgets.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    super.key,
    required this.productsCard,
  });

  final List<ProductCard> productsCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 2.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsCard.length,
          itemBuilder: (context, index) {
            return productsCard[index];
          },
        ),
      ),
    );
  }
}