import 'package:firebase_tutorial_one/models/models.dart';
import 'package:firebase_tutorial_one/screens/screens.dart';
import 'package:firebase_tutorial_one/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'constants/app_routes.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    /* var route = AppRoutes.routes(settings: settings).where(
      (route) => route.route == settings.name,
    );
    if (route.isNotEmpty) {
      //route.first.page;
    } */

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case splashRouteName:
        return SplashScreen.route();
      case ProductsByCategory.routeName:
        return ProductsByCategory.route(
          categoriesModel: settings.arguments as CategoriesModel,
        );
      case ProductDetails.routeName:
        return ProductDetails.route(
            product: settings.arguments as ProductModel);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case checkoutRouteName:
        return ChechoutScreen.route();
      default:
        return _errRoute();
    }
  }

  static Route _errRoute() => MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => const Scaffold(appBar: CustomAppBar(title: 'error')),
      );
}
