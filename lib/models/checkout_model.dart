import 'package:equatable/equatable.dart';
import 'package:firebase_tutorial_one/models/models.dart';

class CheckoutModel extends Equatable {
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

  const CheckoutModel(
    this.email,
    this.fullName,
    this.address,
    this.city,
    this.country,
    this.zipcode,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
  );

  Map<String, Object> toDocument() {
    Map deliveryInformation = {};
    deliveryInformation['address'] = address;
    deliveryInformation['city'] = city;
    deliveryInformation['country'] = country;
    deliveryInformation['zipcode'] = zipcode;

    return {
      'Email': email!,
      'FullName': fullName!,
      'DeliveryInformation': deliveryInformation,
      'products': products!.map((e) => e.productName).toList(),
      'Subtotal': subtotal!,
      'DeliveryFee': deliveryFee!,
      'Total': total!
    };
  }

  @override
  List<Object?> get props => [
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
      ];
}
