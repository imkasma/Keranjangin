import 'package:flutter/material.dart';
import '../../core/constants/app_defaults.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  _circleButton(Icons.menu),
                  Image.asset(
                    "assets/images/app_logo.png", // sesuaikan
                    height: 30,
                  ),
                  _circleButton(Icons.search),
                ],
              ),

              const SizedBox(height: 20),

              /// 🟢 BANNER
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFBFE3C0),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Order your\nDaily Groceries",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
                    Image.network(
                      "https://i.imgur.com/6unJlSL.png",
                      height: 100,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// 🛍 POPULAR PACKS
              _sectionHeader("Popular Packs"),

              const SizedBox(height: 10),

              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _productCard("Bundle Pack", "Onion, Oil, Salt", 35),
                    _productCard("Medium Spices", "Onion, Oil, Salt", 35),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// 🆕 NEW ITEMS
              _sectionHeader("Our New Item"),

              const SizedBox(height: 10),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
                children: [
                  _newItemCard("Ice Cream", 12),
                  _newItemCard("Chocolate Ice Cream", 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔘 BUTTON BULAT
  Widget _circleButton(IconData icon) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF2F6F3),
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(icon),
    );
  }

  /// 🔥 HEADER SECTION
  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "View All",
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }

  /// 🛍 CARD POPULAR
  Widget _productCard(String title, String desc, double price) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://i.imgur.com/tGChxbZ.png",
            height: 90,
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(desc, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Row(
            children: [
              Text("\$$price",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 6),
              const Text(
                "\$50.32",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// 🆕 CARD NEW ITEM
  Widget _newItemCard(String title, double price) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.network(
            "https://i.imgur.com/oaCY49b.png",
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(title, textAlign: TextAlign.center),
          const SizedBox(height: 6),
          Text("\$$price",
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}