import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/services/api_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var electronicsproductList = List<Product>.empty().obs;
  var jeweleryproductList = List<Product>.empty().obs;
  var mensproductList = List<Product>.empty().obs;
  var womensproductList = List<Product>.empty().obs;

  @override
  void onInit() {
    fetchProductsForElectric();
    fetchProductsForJewelery();
    fetchProductsForMen();
    fetchProductsForWomen();
    super.onInit();
  }

  void fetchProductsForElectric() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProductsForElectric();
      if (products != null) {
        electronicsproductList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProductsForJewelery() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProductsForJewelery();
      if (products != null) {
        jeweleryproductList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProductsForMen() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProductsForMen();
      if (products != null) {
        mensproductList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProductsForWomen() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProductsForWomen();
      if (products != null) {
        womensproductList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
