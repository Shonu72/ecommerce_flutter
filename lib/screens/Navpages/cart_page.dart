import 'package:ecommerce/controllers/add_to_cart_controller.dart';
import 'package:ecommerce/core/utils/cart_tile.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageScreen extends StatelessWidget {
  const CartPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Get.toNamed(Routes.mainPage);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text('Cart Details'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.person,
                size: 30,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total price for selected items: \$${controller.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              );
            }),
            GetX<CartController>(builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      product: controller.cartItems[index],
                      image: controller.cartItems[index].image,
                      name: controller.cartItems[index].title,
                      price: controller.cartItems[index].price.toString(),
                      category: "",
                      quantity: controller
                          .getProductQuantity(controller.cartItems[index]),
                    );
                  },
                ),
              );
            }),
          ],
        ));
  }
}
