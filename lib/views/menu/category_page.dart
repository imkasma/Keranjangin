import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/components/product_tile_square.dart';
import '../../core/constants/constants.dart';
import '../../core/models/dummy_product_model.dart';

class CategoryProductPage extends StatefulWidget {
  const CategoryProductPage({super.key});

  @override
  State<CategoryProductPage> createState() =>
      _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {
  List<ProductModel> allProducts = [];
  List<ProductModel> filteredProducts = [];

  String category = "";
  TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 🔥 ambil category dengan aman
    category = ModalRoute.of(context)?.settings.arguments is String
        ? ModalRoute.of(context)!.settings.arguments as String
        : "Others";

    // 🔥 ambil data sesuai kategori
    allProducts = dummyProducts.where((product) {
      return product.category.toLowerCase() ==
          category.toLowerCase();
    }).toList();

    filteredProducts = allProducts;
  }

  // 🔥 fungsi search
  void search(String query) {
    final result = allProducts.where((product) {
      return product.name
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredProducts = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        leading: const AppBackButton(),
      ),

      body: Column(
        children: [
          // 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search in $category...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    search("");
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // 🛒 PRODUCT GRID
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text("Produk tidak ditemukan 😢"),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(AppDefaults.padding),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];

                      return ProductTileSquare(
                        data: product,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}