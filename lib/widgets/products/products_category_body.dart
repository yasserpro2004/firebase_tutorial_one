import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets.dart';

class ProductsByCategoryBody extends StatelessWidget {
  final CategoriesModel _category;
  const ProductsByCategoryBody({super.key, required CategoriesModel category})
      : _category = category;

  @override
  Widget build(BuildContext context) {
    var productsCardByCategory = ProductModel.products
        .where((product) => product.productCategory == _category.categoryName)
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              _category.categoryImageURL,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height / 3.5) * 2 - 66,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: productsCardByCategory.length,
                  itemBuilder: ((context, index) {
                    return Center(
                      child: ProductCard(
                        product: productsCardByCategory[index],
                      ),
                    );
                  })),
            ),
          )
        ],
      ),
    );
  }
}
