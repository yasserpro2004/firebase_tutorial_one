part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckoutEvent extends CheckoutEvent {
  final String? email;
  final String? fullName;
  final String? address;
  final String? city;
  final String? country;
  final String? zipcode;
  final CartModel? cart;

  const UpdateCheckoutEvent({
    this.email,
    this.fullName,
    this.address,
    this.city,
    this.country,
    this.zipcode,
    this.cart,
  });

  @override
  List<Object?> get props => [
        email,
        fullName,
        address,
        address,
        city,
        country,
        zipcode,
        cart,
      ];
}

class ConfirmCheckoutEvent extends CheckoutEvent {
  final CheckoutModel checkoutModel;

  const ConfirmCheckoutEvent({required this.checkoutModel});

  @override
  List<Object?> get props => [checkoutModel];
}
