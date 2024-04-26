import 'package:ecommerce/controllers/add_to_cart_controller.dart';
import 'package:ecommerce/controllers/category_controller.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/product_tile.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/screens/Navpages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CategoryPageScreen extends StatelessWidget {
  final productController = Get.put(CategoryController());
  final cartController = Get.put(CartController());

  CategoryPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 30,
              )),
          title: const Text(
            'All Categories',
            style: TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: AppColors.secondaryColor,
                  thickness: 0.4,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Text(
                        'Men\'s Clothing',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.mens);
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                              fontFamily: 'Rubik'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 280,
                  child: Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              productController.mensproductList[index]);
                        },
                        staggeredTileBuilder: (index) =>
                            const StaggeredTile.fit(1),
                      );
                    }
                  }),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Text(
                        'Women\'s Clothing',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.womens);
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                              fontFamily: 'Rubik'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 280,
                  child: Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              productController.womensproductList[index]);
                        },
                        staggeredTileBuilder: (index) =>
                            const StaggeredTile.fit(1),
                      );
                    }
                  }),
                  //    StaggeredGridView.countBuilder(
                  //     crossAxisCount: 2,
                  //     itemCount: 2,
                  //     crossAxisSpacing: 5,
                  //     mainAxisSpacing: 5,
                  //     itemBuilder: (context, index) {
                  //       return const ProductTile();
                  //     },
                  //     staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  //   ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Text(
                        'Electronics',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.electric);
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                              fontFamily: 'Rubik'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 280,
                  child: Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        // itemCount: productController.productList.length,
                        itemCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              productController.electronicsproductList[index]);
                        },
                        staggeredTileBuilder: (index) =>
                            const StaggeredTile.fit(1),
                      );
                    }
                  }),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Text(
                        'Jewellery',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.jewelery);
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                              fontFamily: 'Rubik'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 280,
                  child: Obx(() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        // itemCount: productController.productList.length,
                        itemCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              productController.jeweleryproductList[index]);
                        },
                        staggeredTileBuilder: (index) =>
                            const StaggeredTile.fit(1),
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
