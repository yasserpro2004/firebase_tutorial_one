import 'package:firebase_tutorial_one/models/models.dart';
abstract class BaseCheckoutRepository {
  Future<void> addCheckout(CheckoutModel checkoutModel);
}
