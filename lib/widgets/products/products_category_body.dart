import 'package:flutter/material.dart';
import '../../bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/constants.dart';
import '../../models/models.dart';
import '../widgets.dart';

class ProductsByCategoryBody extends StatelessWidget {
  final CategoriesModel _category;
  const ProductsByCategoryBody({super.key, required CategoriesModel category})
      : _category = category;

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadedProductsState) {
                var data = state.data
                    .where((product) =>
                        product.productCategory == _category.categoryName)
                    .toList();
                return SingleChildScrollView(
                  child: SizedBox(
                    height: (MediaQuery.of(context).size.height / 4.41) * 2,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return Center(
                            child: ProductCard(
                              product: data[index],
                            ),
                          );
                        })),
                  ),
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
