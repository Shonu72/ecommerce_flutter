import 'package:ecommerce/models/products.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  var product = Product(
    id: 0,
    title: '',
    price: 0.0,
    description: '',
    category: '',
    image: '',
    rating: Rating(rate: 0.0, count: 0),
  ).obs;

  Future<void> fetchProductById(int id) async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      if (response.statusCode == 200) {
        var parsedJson = json.decode(response.body);
        var productData = Product.fromJson(parsedJson);
        product(productData);
        print(product(productData));
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception('Failed to load product: $e');
    } finally {
      isLoading(false);
    }
  }
}
