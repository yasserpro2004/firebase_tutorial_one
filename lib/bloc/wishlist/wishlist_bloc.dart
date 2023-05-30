import 'package:firebase_tutorial_one/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<StartWishlistEvent>(startWishList);
    on<AddWishlistEvent>(addWishListProduct);
    on<RemoveWishlistEvent>(removeWishListProduct);
  }

  void startWishList(
      StartWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistInitialState());
    try {
      emit(const WishlistLoadedState());
    } catch (_) {}
  }

  void addWishListProduct(
      AddWishlistEvent event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoadedState) {
      try {
        emit(
          WishlistLoadedState(
            wishlist: WishlistModel(
              wishlistProducts: List.from(state.wishlist.wishlistProducts)
                ..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
   void removeWishListProduct(
      RemoveWishlistEvent event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoadedState) {
      try {
        emit(
          WishlistLoadedState(
            wishlist: WishlistModel(
              wishlistProducts: List.from(state.wishlist.wishlistProducts)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
