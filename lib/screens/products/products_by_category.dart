import 'package:firebase_tutorial_one/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductsByCategory extends StatelessWidget {
  final CategoriesModel _categoriesModel;

  const ProductsByCategory(
      {super.key, required CategoriesModel categoriesModel})
      : _categoriesModel = categoriesModel;

  static const String routeName = '/ProductsByCategory';

  static Route route({required CategoriesModel categoriesModel}) =>
      MaterialPageRoute(
          settings: const RouteSettings(name: routeName),
          builder: (_) => ProductsByCategory(
                categoriesModel: categoriesModel,
              ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _categoriesModel.categoryName),
      bottomNavigationBar: const CustomNavigationBar(routeName: routeName),
      body: ProductsByCategoryBody(category: _categoriesModel),
    );
  }
}
