import 'package:equatable/equatable.dart';
import 'package:firebase_tutorial_one/models/models.dart';

class CartModel extends Equatable {
  final List<ProductModel> products;

  const CartModel({this.products = const <ProductModel>[]});

  Map productsQuantity(products) {
    final Map<ProductModel, int> quantity = {};
    for (ProductModel product in products) {
      quantity.update(product, (value) {
        final int qty = value + 1;
        return qty;
      }, ifAbsent: () => 1);
    }
    return quantity;
  }

  double get subtotal => products.fold(0, (sum, e) => sum + e.price);
  double get deliveryFee => subtotal >= 20 ? 0 : 10;
  double get total => subtotal + deliveryFee;

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee.toStringAsFixed(2);
  String get totalString => total.toStringAsFixed(2);

  String get freeDelivery => subtotal >= 20
      ? 'You have Free Delivery'
      : 'Add \$${(subtotal - 20).toStringAsFixed(2)} for Free Delivery';

  @override
  List<Object?> get props => [products];
}
