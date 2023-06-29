part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class StartCartEvent extends CartEvent{}

class CartAddEvent extends CartEvent {
  final ProductModel product;

  const CartAddEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class CartRemoveEvent extends CartEvent {
  final ProductModel product;

  const CartRemoveEvent({required this.product});

  @override
  List<Object> get props => [product];
}