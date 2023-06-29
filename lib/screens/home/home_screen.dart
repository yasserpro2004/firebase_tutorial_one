import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../bloc/blocs.dart';
import '../../config/constants.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';

  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreen(),
      );

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Zero to unicorn'),
      bottomNavigationBar: const CustomNavigationBar(
        routeName: routeName,
      ),
      body: Column(
        children: [
          BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
            if (state is CategoriesInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CategoriesLoaded) {
              return CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: state.categories
                    .map((category) => CarouselCard(category: category))
                    .toList(),
              );
            } else {
              return const Center(
                child: Text(errorMessage),
              );
            }
          }),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is LoadedProductsState) {
                return Column(
                  children: [
                    const SectionTitle(title: 'RECOMMENDED'),
                    ProductCarousel(
                      products: state.data.where((p) => p.isRecommend).toList(),
                    ),
                    const SectionTitle(title: 'Popular'),
                    ProductCarousel(
                      products: state.data.where((p) => p.isPopular).toList(),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(errorMessage),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
