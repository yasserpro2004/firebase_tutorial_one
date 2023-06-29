import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial_one/models/checkout_model.dart';
import 'package:firebase_tutorial_one/repositories/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(CheckoutModel checkoutModel) async {
    await _firebaseFirestore
        .collection('checkout')
        .add(checkoutModel.toDocument());
  }
  
}
