import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String productID;
  final String productName;
  final String productImageURL;
  final String productCategory;

  const ProductModel({
    required this.productID,
    required this.productName,
    required this.productImageURL,
    required this.productCategory,
  });

  @override
  List<Object?> get props =>
      [productID, productName, productCategory, productImageURL];
}
