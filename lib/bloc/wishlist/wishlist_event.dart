part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlistEvent extends WishlistEvent {}

class AddWishlistEvent extends WishlistEvent {
  final ProductModel product;
  const AddWishlistEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveWishlistEvent extends WishlistEvent {
  final ProductModel product;
  const RemoveWishlistEvent({required this.product});

  @override
  List<Object> get props => [product];
}
