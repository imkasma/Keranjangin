import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/constants.dart';
import '../../core/models/product_model.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/viewmodels/product_provider.dart';

class CategoryProductPage extends StatefulWidget {
  final String category;

  const CategoryProductPage({super.key, required this.category});

  @override
  State<CategoryProductPage> createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final List<ProductModel> displayProducts = productProvider.products.where((
      product,
    ) {
      final bool matchesCategory =
          product.category.toLowerCase().trim() ==
          widget.category.toLowerCase().trim();

      final bool matchesSearch = product.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.category),
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
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search in ${widget.category}...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          setState(() {
                            searchQuery = "";
                          });
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

          /// 🛒 GRID
          Expanded(
            child: productProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : displayProducts.isEmpty
                ? Center(
                    child: Text(
                      "Tidak ada produk di ${widget.category} 😢",
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(AppDefaults.padding),
                    itemCount: displayProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.72,
                        ),
                    itemBuilder: (context, index) {
                      return _ProductCard(product: displayProducts[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  const _ProductCard({required this.product});

  double _safeDouble(dynamic value) {
    if (value == null) return 0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final price = _safeDouble(product.price);
    final mainPrice = _safeDouble(product.mainPrice);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🖼 IMAGE
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: product.cover.startsWith('http')
                  ? Image.network(
                      product.cover,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildPlaceholder(),
                    )
                  : Image.asset(
                      product.cover,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildPlaceholder(),
                    ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text(
                  product.weight,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),

                const SizedBox(height: 6),

                /// 💰 PRICE (FINAL FIX)
                Row(
                  children: [
                    Text(
                      CurrencyFormatter.toRupiah(price),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      CurrencyFormatter.toRupiah(mainPrice),
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
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Icon(Icons.image, size: 40, color: Colors.grey),
      ),
    );
  }
}
