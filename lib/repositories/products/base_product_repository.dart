import 'package:firebase_tutorial_one/models/models.dart';

abstract class BaseProductRepository{
  Stream<List<ProductModel>> getAllProducts();
}