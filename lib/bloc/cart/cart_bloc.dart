import 'package:firebase_tutorial_one/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<StartCartEvent>(_startLoadingCart);
    on<CartAddEvent>(_addToCart);
    on<CartRemoveEvent>(_removeFromCart);
  }

  void _startLoadingCart(StartCartEvent event, Emitter<CartState> emit) async {
    emit(const CartUpdatedlState());
  }

  void _addToCart(CartAddEvent event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartUpdatedlState) {
      try {
        emit(
          CartUpdatedlState(
            productCart: CartModel(
              products: List.from(state.productCart.products)
                ..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _removeFromCart(CartRemoveEvent event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartUpdatedlState) {
      try {
        emit(
          CartUpdatedlState(
            productCart: CartModel(
              products: List.from(state.productCart.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
