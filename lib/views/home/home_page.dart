import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/routes/app_routes.dart';
import '../../core/viewmodels/product_provider.dart';
import '../../core/models/product_model.dart'; // Pastikan import model

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Memanggil API melalui Provider saat halaman dimuat
    Future.microtask(() => context.read<ProductProvider>().fetchAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Consumer<ProductProvider>(
          // Bungkus dengan Consumer agar responsif terhadap loading
          builder: (context, provider, child) {
            return RefreshIndicator(
              // Tambahkan fitur tarik untuk refresh
              onRefresh: () => provider.fetchAllProducts(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔥 TOP BAR
                    _buildTopBar(context),

                    const SizedBox(height: 20),

                    /// 🟢 BANNER
                    _buildBanner(),

                    const SizedBox(height: 25),

                    /// 🛍 POPULAR PACKS
                    _sectionHeader("Popular Products", () {
                      Navigator.pushNamed(context, AppRoutes.popularItems);
                    }),

                    const SizedBox(height: 10),

                    // Logic Loading & Grid
                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _buildHorizontalList(provider.products),

                    const SizedBox(height: 25),

                    /// 🆕 NEW ITEMS (Mengambil data yang sama atau filter kategori lain)
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

  /// --- WIDGET HELPERS ---

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _circleButton(Icons.menu, () {
          Navigator.pushNamed(context, AppRoutes.drawerPage);
        }),
        Image.asset(
          "assets/images/app_logo.png",
          height: 35,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.shopping_basket, color: Colors.green, size: 30),
        ),
        _circleButton(Icons.search, () {
          Navigator.pushNamed(context, AppRoutes.search);
        }),
      ],
    );
  }

  Widget _buildHorizontalList(List<ProductModel> products) {
    if (products.isEmpty) return const Text("Data tidak tersedia");

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length > 5
            ? 5
            : products.length, // Limit 5 item saja untuk horizontal
        itemBuilder: (context, index) {
          final item = products[index];
          return _productCard(item);
        },
      ),
    );
  }

  Widget _buildNewItemsGrid(List<ProductModel> products) {
    if (products.isEmpty) return const Text("Data tidak tersedia");

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length > 4 ? 4 : products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item =
            products[products.length - 1 - index]; // Ambil dari yang terbaru
        return _productCard(item, isGrid: true);
      },
    );
  }

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
            Expanded(
              child: Center(
                child: item.cover.startsWith('http')
                    ? Image.network(item.cover, fit: BoxFit.contain)
                    : Image.asset(item.cover, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              item.category,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              "Rp ${item.price.toInt()}", // Format ke Rupiah
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

  // --- Widget banner & Header tetap sama seperti kodinganmu ---
  Widget _buildBanner() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFBFE3C0),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Order your\nDaily Groceries",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "#Free Delivery",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Image.network("https://i.imgur.com/6unJlSL.png", height: 100),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text("View All", style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF2F6F3),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon),
      ),
    );
  }
}
