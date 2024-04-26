import 'package:ecommerce/controllers/add_to_cart_controller.dart';
import 'package:ecommerce/controllers/category_controller.dart';
import 'package:ecommerce/controllers/products_controller.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/product_tile.dart';
import 'package:ecommerce/screens/Navpages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ElectricCategory extends StatelessWidget {
  ElectricCategory({Key? key}) : super(key: key);
  final electricProductController = Get.put(CategoryController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              )),
          title: const Text(
            "Electronics",
            style: TextStyle(
                fontFamily: 'Rubik', fontWeight: FontWeight.bold),
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
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Wrap(children: [
                        Icon(Icons.filter_alt_rounded),
                        Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Wrap(children: [
                        Icon(Icons.connecting_airports_rounded),
                        Text(
                          'Sort by',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() {
                    if (electricProductController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: electricProductController.electronicsproductList.length,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              electricProductController.electronicsproductList[index]);
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

class JeweleryCategory extends StatelessWidget {
  JeweleryCategory({Key? key}) : super(key: key);
  final jeweleryProductController = Get.put(CategoryController());
    final cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              )),
          title: const Text(
            "Jewelery",
            style: TextStyle(
                fontFamily: 'Rubik', fontWeight: FontWeight.bold),
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
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Wrap(children: [
                        Icon(Icons.filter_alt_rounded),
                        Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Wrap(children: [
                        Icon(Icons.connecting_airports_rounded),
                        Text(
                          'Sort by',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() {
                    if (jeweleryProductController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: jeweleryProductController.jeweleryproductList.length,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              jeweleryProductController.jeweleryproductList[index]);
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

class MensCategory extends StatelessWidget {
  MensCategory({Key? key}) : super(key: key);
  final mensProductController = Get.put(CategoryController());
    final cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              )),
          title: const Text(
            "Men's Clothing",
            style: TextStyle(
                fontFamily: 'Rubik', fontWeight: FontWeight.bold),
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
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Wrap(children: [
                        Icon(Icons.filter_alt_rounded),
                        Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Wrap(children: [
                        Icon(Icons.connecting_airports_rounded),
                        Text(
                          'Sort by',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() {
                    if (mensProductController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: mensProductController.mensproductList.length,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              mensProductController.mensproductList[index]);
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

class WomensCategory extends StatelessWidget {
  WomensCategory({Key? key}) : super(key: key);
  final womensProductController = Get.put(CategoryController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              )),
          title: const Text(
            "Women's Clothing",
            style: TextStyle(
                fontFamily: 'Rubik', fontWeight: FontWeight.bold),
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
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Wrap(children: [
                        Icon(Icons.filter_alt_rounded),
                        Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Wrap(children: [
                        Icon(Icons.connecting_airports_rounded),
                        Text(
                          'Sort by',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                      ]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() {
                    if (womensProductController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: womensProductController.womensproductList.length,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              womensProductController.womensproductList[index]);
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
