import 'package:ecommerce/models/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = List<Product>.empty().obs;

  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price));

  addToCart(Product item) {
    cartItems.add(item);
  }

  removeFromCart(item) {
    cartItems.remove(item);
  }

  int getProductQuantity(Product product) {
    return cartItems.where((item) => item.id == product.id).length;
  }
}
