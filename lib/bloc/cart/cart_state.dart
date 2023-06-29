part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitialState extends CartState {}

class CartUpdatedlState extends CartState {
  final CartModel productCart;
  const CartUpdatedlState({this.productCart = const CartModel()});

  @override
  List<Object> get props => [productCart];
}

class CartErrorState extends CartState {}
