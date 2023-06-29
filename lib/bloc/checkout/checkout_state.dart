part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class LoadedCheckoutState extends CheckoutState {
  final String? email;
  final String? fullName;
  final String? address;
  final String? city;
  final String? country;
  final String? zipcode;
  final List<ProductModel>? products;
  final double? subtotal;
  final double? deliveryFee;
  final double? total;
  final CheckoutModel checkoutModel;

  LoadedCheckoutState({
    this.email,
    this.fullName,
    this.address,
    this.city,
    this.country,
    this.zipcode,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,}
  ) : checkoutModel = CheckoutModel(
          email,
          fullName,
          address,
          city,
          country,
          zipcode,
          products,
          subtotal,
          deliveryFee,
          total,
        );
}
