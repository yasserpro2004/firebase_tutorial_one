import 'package:firebase_tutorial_one/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<StartWishlistEvent>(_startWishList);
    on<AddWishlistEvent>(_addWishListProduct);
    on<RemoveWishlistEvent>(_removeWishListProduct);
  }

  void _startWishList(
      StartWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistInitialState());
    try {
      emit(const WishlistLoadedState());
    } catch (_) {}
  }

  void _addWishListProduct(
      AddWishlistEvent event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoadedState) {
      //final lst = List.from(state.wishlist.wishlistProducts);
      if (!List.from(state.wishlist.wishlistProducts).contains(event.product)) {
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
  }

  void _removeWishListProduct(
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
