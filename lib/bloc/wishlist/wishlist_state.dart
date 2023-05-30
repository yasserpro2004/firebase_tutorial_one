part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistInitialState extends WishlistState {}

class WishlistLoadedState extends WishlistState {
  final WishlistModel wishlist;
  const WishlistLoadedState({this.wishlist = const WishlistModel()});

  @override
  List<Object> get props => [wishlist];
}

class WishlistErrorState extends WishlistState {}
