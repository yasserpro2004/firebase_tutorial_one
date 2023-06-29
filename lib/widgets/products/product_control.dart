import 'package:firebase_tutorial_one/config/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../models/models.dart';

abstract class ProductsControl extends StatelessWidget {
  final ProductModel product;

  const ProductsControl({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WishlistControl extends ProductsControl {
  const WishlistControl({super.key, required ProductModel product})
      : super(product: product);

  //final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.add_circle_rounded),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                try {
                  context.read<WishlistBloc>().add(
                        RemoveWishlistEvent(
                          product: product,
                        ),
                      );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          '${product.productName} was removed from wishlist'),
                    ),
                  );
                } catch (_) {}
              },
              child: const Icon(Icons.delete),
            )
          ].createShadow().toList(),
        ),
      ),
    );
  }
}

class CartControl extends ProductsControl {
  const CartControl(
      {super.key, required ProductModel product, required this.productQuantity})
      : super(product: product);

  final int productQuantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitialState) {
              return const CircularProgressIndicator();
            }
            if (state is CartUpdatedlState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<CartBloc>().add(
                            CartAddEvent(product: product),
                          );
                    },
                    child: const Icon(Icons.add_circle_rounded),
                  ),
                  Text(
                    ' $productQuantity ',
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CartBloc>().add(
                            CartRemoveEvent(product: product),
                          );
                    },
                    child: const Icon(Icons.remove_circle_rounded),
                  )
                ].createShadow().toList(),
              );
            } else {
              return const Text('something went wrong');
            }
          },
        ),
      ),
    );
  }
}
