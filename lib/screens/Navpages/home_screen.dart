import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/category_list.dart';
import 'package:ecommerce/core/utils/image_slider.dart';
import 'package:ecommerce/core/utils/trending_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.document_scanner_outlined,
                size: 30,
              )),
          title: const Text(
            'ShopWorks',
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
                const ImageSlider(),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                            fontFamily: 'Rubik'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ContainerList(),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Text(
                        'Trending',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                            fontFamily: 'Rubik'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 280,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    itemBuilder: (context, index) {
                      return const ProductTile();
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 5),
                      child: Text(
                        'Sales',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rubik'),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryColor,
                            fontFamily: 'Rubik'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 280,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    itemBuilder: (context, index) {
                      return const ProductTile();
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Search...';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "null");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your result display logic here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your suggestion display logic here
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: searchFieldDecorationTheme?.copyWith(
        labelStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black),
          ),
      textTheme: Theme.of(context).textTheme.copyWith(
            titleSmall: const TextStyle(color: Colors.black),
          ),
    );
  }
}
