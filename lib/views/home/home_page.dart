import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/viewmodels/product_provider.dart';
import '../../core/models/product_model.dart';
import '../../core/models/bundle_model.dart';
import '../../core/utils/currency_formatter.dart';
import 'bundle_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductProvider>().fetchAllProducts();
    });
  }

  // ================= BUNDLE DATA =================
  final List<BundleModel> bundles = [
    BundleModel(
      name: "Paket Hemat Ayam",
      cover: "https://images.unsplash.com/photo-1617196034183-421b4917c92d",
      itemNames: ["Ayam Geprek", "Es Teh"],
      price: 30000,
      mainPrice: 45000,
    ),
    BundleModel(
      name: "Paket Bakso",
      cover: "https://images.unsplash.com/photo-1613145997970-db84a7975fbb",
      itemNames: ["Bakso", "Mie"],
      price: 20000,
      mainPrice: 28000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return RefreshIndicator(
              onRefresh: () => provider.fetchAllProducts(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(context),
                    const SizedBox(height: 20),

                    _buildBanner(),
                    const SizedBox(height: 25),

                    // ================= POPULAR =================
                    _sectionHeader("Popular Products", () {
                      Navigator.pushNamed(context, AppRoutes.popularItems);
                    }),
                    const SizedBox(height: 10),

                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _buildHorizontalList(provider.products),

                    const SizedBox(height: 25),

                    // ================= BUNDLE =================
                    _sectionHeader("Bundle Products", () {}),

                    const SizedBox(height: 10),

                    _buildBundleList(),

                    const SizedBox(height: 25),

                    // ================= NEW =================
                    _sectionHeader("Our New Item", () {
                      Navigator.pushNamed(context, AppRoutes.newItems);
                    }),

                    const SizedBox(height: 10),

                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _buildNewItemsGrid(provider.products),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ================= TOP BAR =================
  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _circleButton(Icons.menu, () {
          Navigator.pushNamed(context, AppRoutes.drawerPage);
        }),
        const Text(
          "Grocery App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _circleButton(Icons.search, () {
          Navigator.pushNamed(context, AppRoutes.search);
        }),
      ],
    );
  }

  // ================= BUNDLE =================
  Widget _buildBundleList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bundles.length,
        itemBuilder: (context, index) {
          final item = bundles[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BundleDetailsPage(bundle: item),
                ),
              );
            },
            child: Container(
              width: 160,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.network(
                        item.cover,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.fastfood),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Text(
                    item.itemNames.join(", "),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  const SizedBox(height: 6),

                  // 🔥 FIX HARGA BUNDLE
                  Text(
                    CurrencyFormatter.convertToIdr(item.price, 0),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= PRODUCT CARD =================
  Widget _productCard(ProductModel item, {bool isGrid = false}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetails, arguments: item);
      },
      child: Container(
        width: isGrid ? null : 170,
        margin: isGrid ? EdgeInsets.zero : const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: Image.network(item.cover))),
            const SizedBox(height: 10),

            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(
              item.category,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),

            const SizedBox(height: 8),

            // 🔥 FIX HARGA PRODUCT
            Text(
              CurrencyFormatter.convertToIdr(item.price, 0),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= OTHER UI =================
  Widget _sectionHeader(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: onTap, child: const Text("View All")),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF2F6F3),
        ),
        child: Icon(icon),
      ),
    );
  }

  Widget _buildHorizontalList(List<ProductModel> products) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _productCard(products[index]);
        },
      ),
    );
  }

  Widget _buildNewItemsGrid(List<ProductModel> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = products[index];
        return _productCard(item, isGrid: true);
      },
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFBFE3C0),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: const Text(
        "Order your Daily Groceries\n#Free Delivery",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
