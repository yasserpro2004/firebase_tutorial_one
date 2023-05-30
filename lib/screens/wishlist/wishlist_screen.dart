import 'package:firebase_tutorial_one/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';

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
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoadedState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: state.wishlist.wishlistProducts.length,
                itemBuilder: ((context, index) {
                  return Center(
                    child: WishlistProductCard(
                      product: state.wishlist.wishlistProducts[index],
                    ),
                  );
                }),
              ),
            );
          } else {
            return const Center(
              child: Text('something went wrong'),
            );
          }
        },
      ),
    );
  }
}
