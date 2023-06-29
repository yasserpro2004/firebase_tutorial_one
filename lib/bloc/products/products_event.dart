part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class StartLoadingProduct extends ProductsEvent {}

class UpdateProductsEvent extends ProductsEvent {
  final List<ProductModel> data;
  const UpdateProductsEvent({required this.data});

  @override
  List<Object> get props => [data];
}
