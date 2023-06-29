part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class LoadedProductsState extends ProductsState {
  final List<ProductModel> data;
  const LoadedProductsState({required this.data});

  @override
  List<Object> get props => [data];
}
