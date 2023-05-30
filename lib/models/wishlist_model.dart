import 'package:equatable/equatable.dart';
import 'package:firebase_tutorial_one/models/models.dart';

class WishlistModel extends Equatable {
  final List<ProductModel> wishlistProducts;

  const WishlistModel({this.wishlistProducts = const <ProductModel>[]});

  @override
  List<Object?> get props => [wishlistProducts];
}
