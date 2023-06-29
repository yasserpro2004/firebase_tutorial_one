import 'package:firebase_tutorial_one/screens/screens.dart';
import 'package:flutter/material.dart';

import '../bloc/blocs.dart';
import '../config/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  final String routeName;
  final String? totalVal;
  const CustomNavigationBar(
      {super.key, required this.routeName, this.totalVal});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: IconTheme(
          data: const IconThemeData(color: Colors.white, size: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _selectNavBar(context, routeName)!,
          ),
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(BuildContext context, String screen) {
    switch (screen) {
      case HomeScreen.routeName:
        return _buildNavbar(context);
      case ProductsByCategory.routeName:
        return _buildNavbar(context);
      case WishListScreen.routeName:
        return _buildNavbar(context);
      case CartScreen.routeName:
        return _cartScreenNavbar(context);
      case checkoutRouteName:
        return _checkoutScreenNavbar(context);
      default:
    }
    return null;
  }

  List<Widget> _buildNavbar(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(Icons.home, color: Colors.white)),
      IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
          icon: const Icon(Icons.shopping_cart, color: Colors.white)),
      IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/user');
          },
          icon: const Icon(Icons.person, color: Colors.white)),
    ];
  }

  List<Widget> _cartScreenNavbar(BuildContext context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
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
      /*   const Text(
        'Total :\$ 25',
        style: TextStyle(fontWeight: FontWeight.bold),
      ) */
    ];
  }

  List<Widget> _checkoutScreenNavbar(BuildContext context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedCheckoutState) {
            return ElevatedButton(
              onPressed: () {
                context.read<CheckoutBloc>().add(
                    ConfirmCheckoutEvent(checkoutModel: state.checkoutModel));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                'Order Now',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ];
  }
}
