import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_tutorial_one/config/app_route.dart';
import 'package:flutter/material.dart';
import 'bloc/blocs.dart';
import 'repositories/repositories.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlistEvent())),
        BlocProvider(create: (_) => CartBloc()..add(StartCartEvent())),
        BlocProvider(
            create: (_) => CategoriesBloc(
                  categoriesRepository: CategoriesRepository(),
                )..add(StartCategoriesLoading())),
        BlocProvider(
            create: (_) => ProductsBloc(productRepository: ProductRepository())
              ..add(StartLoadingProduct())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository()))
      ],
      child: MaterialApp(
        title: 'demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        home: const SplashScreen(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
