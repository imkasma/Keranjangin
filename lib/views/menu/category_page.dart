import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/constants.dart';
import '../../core/models/dummy_product_model.dart';

class CategoryProductPage extends StatefulWidget {
  final String category;

  const CategoryProductPage({
    super.key,
    required this.category,
  });

  @override
  State<CategoryProductPage> createState() =>
      _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {
  List<ProductModel> allProducts = [];
  List<ProductModel> filteredProducts = [];

  late String category;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    category = widget.category;

    /// 🔥 FILTER SESUAI CATEGORY (AMAN + TRIM + LOWERCASE)
    allProducts = dummyProducts.where((product) {
      return product.category.toLowerCase().trim() ==
          category.toLowerCase().trim();
    }).toList();

    filteredProducts = allProducts;
  }

  /// 🔍 SEARCH FUNCTION
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
  void dispose() {
    searchController.dispose(); // ✅ FIX memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      /// 🔝 APPBAR
      appBar: AppBar(
        title: Text(category),
        leading: const AppBackButton(),
        elevation: 0,
      ),

      body: Column(
        children: [

          /// 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search in $category...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          search("");
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          /// 🛒 PRODUCT GRID
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      "Tidak ada produk di $category 😢",
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(AppDefaults.padding),
                    itemCount: filteredProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];

                      return _ProductCard(product: product);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}






/// 🔥 PRODUCT CARD (DIPISAH BIAR RAPI)
class _ProductCard extends StatelessWidget {
  final ProductModel product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🖼 IMAGE
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                product.cover,
                width: double.infinity,
                fit: BoxFit.cover,

                /// ✅ SAFE IMAGE (kalau gambar belum ada)
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.image, size: 40),
                    ),
                  );
                },
              ),
            ),
          ),

          /// 📄 INFO
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),

                Text(
                  product.weight,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 6),

                /// 💰 PRICE + DISCOUNT
                Row(
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "\$${product.mainPrice}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}