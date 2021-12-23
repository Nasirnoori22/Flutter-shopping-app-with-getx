import 'package:dart_example/controllers/shopping_controller.dart';
import 'package:dart_example/models/product.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  // ignore: deprecated_member_use
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
