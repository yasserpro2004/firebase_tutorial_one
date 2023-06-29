import 'package:flutter/material.dart';
import '../../bloc/blocs.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../screens/screens.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/homeScreen';
  static const String productByCategory = '/ProductsByCategory';
  static const String productDetail = '/productDetails';
  static const String wishlist = '/wishlist';
  static const String cart = '/cart';
  static const String checkout = '/checkout';

  static List<PageIntity> routes({RouteSettings? settings}) => [
        const PageIntity(
          route: splash,
          page: SplashScreen(),
        ),
        const PageIntity(
          route: '/',
          page: HomeScreen(),
        ),
        const PageIntity(
          route: home,
          page: HomeScreen(),
        ),
        PageIntity(
          route: productByCategory,
          page: ProductsByCategory(
              categoriesModel: settings?.arguments as CategoriesModel),
        ),
        PageIntity(
          route: productDetail,
          page: ProductDetails(product: settings?.arguments as ProductModel),
        ),
        const PageIntity(
          route: cart,
          page: CartScreen(),
        ),
        const PageIntity(
          route: wishlist,
          page: WishListScreen(),
        ),
        const PageIntity(
          route: checkout,
          page: ChechoutScreen(),
        ),
      ];

  static List<dynamic> blocProviders() => [
        BlocProvider(
            create: (_) => CategoriesBloc(
                  categoriesRepository: CategoriesRepository(),
                )..add(StartCategoriesLoading())),
        BlocProvider(
            create: (_) => ProductsBloc(productRepository: ProductRepository())
              ..add(StartLoadingProduct())),
        BlocProvider(create: (_) => CartBloc()..add(StartCartEvent())),
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlistEvent())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
      ];

  static Route onGenerateRoute(RouteSettings settings) {
    var route = routes(settings: settings).firstWhere(
      (pageIntity) => pageIntity.route == settings.name,
      orElse: () => PageIntity.empty(),
    );

    if (route.isEmpty) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      );
    } else {
      return MaterialPageRoute(
        settings: RouteSettings(name: route.route),
        builder: (context) => route.page,
      );
    }
  }
}
