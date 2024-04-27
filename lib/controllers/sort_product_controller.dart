import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/services/api_services.dart';
import 'package:get/get.dart';

class SortProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    sortProducts(category);
    super.onInit();
  }

  Category? category;
  void sortProducts(category) async {
    try {
      isLoading(true);
      var products;
      if (category == null) {
        products = await ApiService.fetchProducts();
      } else {
        products = await ApiService.sortProducts(category);
      }
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
