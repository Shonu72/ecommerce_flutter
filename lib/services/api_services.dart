import 'dart:convert';
import 'package:ecommerce/models/products.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static var client = http.Client();
  static Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<List<Product>> fetchProducts() async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return <Product>[];
    }
  }

  static Future<List<Product>> fetchProductsForElectric() async {
    var response = await client.get(
        Uri.parse('https://fakestoreapi.com/products/category/electronics'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return <Product>[];
    }
  }

  static Future<List<Product>> fetchProductsForJewelery() async {
    var response = await client.get(
        Uri.parse('https://fakestoreapi.com/products/category/jewelery'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return <Product>[];
    }
  }

  static Future<List<Product>> fetchProductsForMen() async {
    var response = await client.get(
        Uri.parse('https://fakestoreapi.com/products/category/men\'s clothing'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return <Product>[];
    }
  }

  static Future<List<Product>> fetchProductsForWomen() async {
    var response = await client.get(Uri.parse(
        'https://fakestoreapi.com/products/category/women\'s clothing'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return <Product>[];
    }
  }
}
