import 'package:ecommerce/controllers/add_to_cart_controller.dart';
import 'package:ecommerce/controllers/products_controller.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product, {super.key});
  final cartController = Get.find<CartController>();
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    int rating = product.rating.rate!.toInt();
    // final cartController = Get.find<CartController>();
    // final productController = Get.find<ProductController>();
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    // "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80",
                    product.image,
                    height: 130,
                    fit: BoxFit.cover,

                    width: double.maxFinite,
                  ),
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                )
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < rating
                      ? AppColors.starColor
                      : AppColors.secondaryColor,
                );
              }),
            ),
            Text(
              product.title,
              // "Evening Dress",
              maxLines: 1,
              style: const TextStyle(
                  fontFamily: 'Rubik', fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "\$ ${product.price}",
              // "\$200",
              maxLines: 1,
              style: const TextStyle(
                  fontFamily: 'Rubik', fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(170, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      cartController.addToCart(productController.productList[
                          productController.productList.indexOf(product)]);
                    },
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
