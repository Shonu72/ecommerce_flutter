import 'package:ecommerce/controllers/add_to_cart_controller.dart';
import 'package:ecommerce/controllers/category_controller.dart';
import 'package:ecommerce/controllers/sort_product_controller.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/category_list.dart';
import 'package:ecommerce/core/utils/product_tile.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/screens/Navpages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CategoryPageScreen extends StatefulWidget {
  const CategoryPageScreen({super.key});

  @override
  State<CategoryPageScreen> createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen> {
  final productController = Get.put(CategoryController());
  final cartController = Get.put(CartController());
  final sortCOntroller = Get.put(SortProductController());

  int _value = 0;

  List<String> Categorietitle = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

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
            'Explore',
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
          scrollDirection: Axis.vertical,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: AppColors.secondaryColor,
                  thickness: 0.4,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(Categorietitle.length, (index) {
                        return MyRadioListTile<int>(
                          value: index,
                          groupValue: _value,
                          leading: Categorietitle[index],
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                              productController.fetchProductsByCategory(
                                  _value == 0 ? null : Categorietitle[_value]);
                            });
                          },
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Wrap(
                        children: [
                          Icon(Icons.filter_alt_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Filter")
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              final tiles = [
                                {
                                  'icon': Icons.fiber_new_outlined,
                                  'text': 'latest'
                                },
                                {'icon': Icons.currency_rupee, 'text': 'price'},
                                {
                                  'icon': Icons.star_border_purple500,
                                  'text': 'popular'
                                },
                                {
                                  'icon': Icons.new_releases_outlined,
                                  'text': 'relevence'
                                },
                              ];

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text('Sort by',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: 250,
                                    child: ListView.builder(
                                      itemCount: tiles.length,
                                      itemBuilder: (context, index) {
                                        final tile = tiles[index];
                                        return ListTile(
                                          leading:
                                              Icon(tile['icon'] as IconData),
                                          title: Text(tile['text'] as String),
                                          onTap: () {
                                            // Perform API call or any action based on the tile
                                            // For example, you can use tile['text'] to determine the action
                                            sortCOntroller
                                                .sortProducts("products");
                                            print('Selected: ${tile['text']}');
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Wrap(
                          children: [
                            Icon(Icons.format_align_center_sharp),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Sort By")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Expanded(
                    child: Obx(() {
                      if (productController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return StaggeredGridView.countBuilder(
                          crossAxisCount: 2,
                          itemCount: productController.productList.length,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          itemBuilder: (context, index) {
                            return ProductTile(
                                productController.productList[index], () {
                              Get.toNamed(Routes.productDetails,
                                  arguments:
                                      productController.productList[index].id);
                            });
                          },
                          staggeredTileBuilder: (index) =>
                              const StaggeredTile.fit(1),
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
