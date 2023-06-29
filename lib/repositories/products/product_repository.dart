import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial_one/models/product_model.dart';
import 'package:firebase_tutorial_one/repositories/products/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<ProductModel>> getAllProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ProductModel.productFromSnapshot(doc),
              )
              .toList(),
        );
  }
}
