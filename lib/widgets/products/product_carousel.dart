import 'package:firebase_tutorial_one/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 2.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]) ;
          },
        ),
      ),
    );
  }
}