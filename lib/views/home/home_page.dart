import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/routes/app_routes.dart';
import '../../core/viewmodels/product_provider.dart';

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(Icons.menu, () {
                    // Pastikan rute ini ada di AppRoutes kamu
                    Navigator.pushNamed(context, AppRoutes.drawerPage);
                  }),
                  Image.asset(
                    "assets/images/app_logo.png", // Pastikan file ada di pubspec.yaml
                    height: 30,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_basket, color: Colors.green),
                  ),
                  _circleButton(Icons.search, () {
                    Navigator.pushNamed(context, AppRoutes.search);
                  }),
                ],
              ),

              const SizedBox(height: 20),

              /// 🟢 BANNER
              _buildBanner(),

              const SizedBox(height: 25),

              /// 🛍 POPULAR PACKS
              _sectionHeader("Popular Packs", () {
                Navigator.pushNamed(context, AppRoutes.popularItems);
              }),

              const SizedBox(height: 10),

              _buildProductList(),

              const SizedBox(height: 25),

              /// 🆕 NEW ITEMS
              _sectionHeader("Our New Item", () {
                Navigator.pushNamed(context, AppRoutes.newItems);
              }),

              const SizedBox(height: 10),

              _buildNewItemsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  /// --- WIDGET HELPERS (Harus di dalam _HomePageState) ---

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
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Image.network(
            "https://i.imgur.com/6unJlSL.png",
            height: 100,
          ),
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

  Widget _buildProductList() {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const SizedBox(height: 220, child: Center(child: CircularProgressIndicator()));
        }
        if (provider.products.isEmpty) {
          return const Text("Tidak ada produk populer");
        }
        return SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final item = provider.products[index];
              return _productCard(item.name, item.category, item.price, () {
                Navigator.pushNamed(context, AppRoutes.productDetails, arguments: item);
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildNewItemsGrid() {
    // Sementara menggunakan data dummy atau bisa dihubungkan ke Provider lain
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.75,
      children: [
        _newItemCard("Ice Cream", 12),
        _newItemCard("Chocolate", 15),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF2F6F3)),
        padding: const EdgeInsets.all(10),
        child: Icon(icon),
      ),
    );
  }

  Widget _productCard(String title, String desc, double price, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network("https://i.imgur.com/tGChxbZ.png", height: 90),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(desc, style: const TextStyle(color: Colors.grey), maxLines: 1),
            const Spacer(),
            Text("\$${price.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _newItemCard(String title, double price) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Image.network("https://i.imgur.com/oaCY49b.png", height: 80),
          const SizedBox(height: 10),
          Text(title, textAlign: TextAlign.center, maxLines: 1),
          const SizedBox(height: 6),
          Text("\$${price.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}