import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/services/api_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    fetchProductsByCategory(category);
    super.onInit();
  }

  Category? category;
  void fetchProductsByCategory(category) async {
    try {
      isLoading(true);
      var products;
      if (category == null) {
        products = await ApiService.fetchProducts();
      } else {
        products = await ApiService.fetchProductsByCategory(category);
      }
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }


}
