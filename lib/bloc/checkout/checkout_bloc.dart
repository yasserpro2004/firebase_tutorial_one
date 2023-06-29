import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_tutorial_one/bloc/blocs.dart';
import 'package:firebase_tutorial_one/repositories/checkout/checkout_repository.dart';
import '../../models/models.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final  CartBloc cartBloc;
  final CheckoutRepository _checkoutRepository;
  //StreamSubscription? checkoutSubscription;
  StreamSubscription? _cartSubscription;
  CheckoutBloc(
      {required this.cartBloc,
      required CheckoutRepository checkoutRepository})
      : _checkoutRepository = checkoutRepository,
        
        super(cartBloc.state is CartUpdatedlState
            ? LoadedCheckoutState(
                products:
                    (cartBloc.state as CartUpdatedlState).productCart.products,
                subtotal:
                    (cartBloc.state as CartUpdatedlState).productCart.subtotal,
                deliveryFee: (cartBloc.state as CartUpdatedlState)
                    .productCart
                    .deliveryFee,
                total: (cartBloc.state as CartUpdatedlState).productCart.total)
            : CheckoutInitial()) {
    _cartSubscription = cartBloc.stream.listen(
      (state) {
        if (state is CartUpdatedlState) {
          add(UpdateCheckoutEvent(cart: state.productCart));
        }
      },
    );

    on<UpdateCheckoutEvent>((event, emit) {
      final state = this.state;

      if (state is LoadedCheckoutState) {
        emit(LoadedCheckoutState(
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          email: event.email ?? state.email,
          zipcode: event.zipcode ?? state.zipcode,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          subtotal: event.cart?.subtotal ?? state.subtotal,
          deliveryFee: event.cart?.deliveryFee ?? state.deliveryFee,
          total: event.cart?.total ?? state.total,
        ));
      }
    });
    on<ConfirmCheckoutEvent>(
      (event, emit) async {
        final state = this.state;
        if (state is LoadedCheckoutState) {
          try {
            await _checkoutRepository.addCheckout(event.checkoutModel);
          } catch (_) {
          }
        }
      },
    );
  }
}
