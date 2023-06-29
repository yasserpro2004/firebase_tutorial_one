import 'package:firebase_tutorial_one/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../config/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  static Route route() => MaterialPageRoute(
      settings: const RouteSettings(name: cartRouteName),
      builder: (_) => const CartScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: cartTitle),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartUpdatedlState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.productCart.freeDelivery),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/");
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor),
                            child: const Text(
                              'Add More items',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 510,
                        child: ListView.builder(
                            itemCount: state.productCart
                                .productsQuantity(state.productCart.products)
                                .length,
                            itemBuilder: (constext, index) {
                              return ProductCardList(
                                controls: CartControl(
                                  product: state.productCart
                                      .productsQuantity(
                                          state.productCart.products)
                                      .keys
                                      .elementAt(index),
                                  productQuantity: state.productCart
                                      .productsQuantity(
                                          state.productCart.products)
                                      .values
                                      .elementAt(index),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CartSummary(),
                      CartNavBar(total: state.productCart.totalString)
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Text('Error ');
          }
        },
      ),
    );
  }
}

class CartNavBar extends StatelessWidget {
  final String total;
  const CartNavBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: primaryColor,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, checkoutRouteName);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: const Text(
              'Go to Checkout',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            'Total :\$ $total',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
