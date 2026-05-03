import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/routes/app_routes.dart';
import 'components/category_tile.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FA),
        body: Column(
          children: [
            const SizedBox(height: 20),

            /// 🔥 TITLE
            Text(
              'Choose a category',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            /// 🔥 GRID
            const Expanded(
              child: CategoriesGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(14),
      crossAxisCount: 3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,

      /// 🔥 FIX OVERFLOW DI SINI
      childAspectRatio: 0.8,

      children: [
        /// 🌱 VEGETABLES
        CategoryTile(
          imageLink: 'https://i.imgur.com/tGChxbZ.png',
          label: 'Vegetables',
          backgroundColor: const Color(0xFF2E7D32),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Vegetables',
            );
          },
        ),

        /// 🥩 MEAT
        CategoryTile(
          imageLink: 'https://i.imgur.com/yOFxoIP.png',
          label: 'Meat And Fish',
          backgroundColor: const Color(0xFF4FC3F7),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Meat And Fish',
            );
          },
        ),

        /// 💊 MEDICINE
        CategoryTile(
          imageLink: 'https://i.imgur.com/GPsRaFC.png',
          label: 'Medicine',
          backgroundColor: const Color(0xFFE53935),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Medicine',
            );
          },
        ),

        /// 👶 BABY CARE
        CategoryTile(
          imageLink: 'https://i.imgur.com/mGRqfnc.png',
          label: 'Baby Care',
          backgroundColor: const Color(0xFFFFD54F),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Baby Care',
            );
          },
        ),

        /// 🏢 OFFICE
        CategoryTile(
          imageLink: 'https://i.imgur.com/fwyz4oC.png',
          label: 'Office Supplies',
          backgroundColor: const Color(0xFF5C6BC0),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Office Supplies',
            );
          },
        ),

        /// 💄 BEAUTY
        CategoryTile(
          imageLink: 'https://i.imgur.com/DNr8a6R.png',
          label: 'Beauty',
          backgroundColor: const Color(0xFFFF4081),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Beauty',
            );
          },
        ),

        /// 🏋️ GYM
        CategoryTile(
          imageLink: 'https://i.imgur.com/O2ZX5nR.png',
          label: 'Gym Equipment',
          backgroundColor: const Color(0xFF6D4C41),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Gym Equipment',
            );
          },
        ),

        /// 🌿 GARDEN
        CategoryTile(
          imageLink: 'https://i.imgur.com/wJBopjL.png',
          label: 'Gardening Tools',
          backgroundColor: const Color(0xFF43A047),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Gardening Tools',
            );
          },
        ),

        /// 🐶 PET
        CategoryTile(
          imageLink: 'https://i.imgur.com/P4yJA9t.png',
          label: 'Pet Care',
          backgroundColor: const Color(0xFFFFEE58),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Pet Care',
            );
          },
        ),

        /// 👓 EYE WEAR
        CategoryTile(
          imageLink: 'https://i.imgur.com/sxGf76e.png',
          label: 'Eye Wears',
          backgroundColor: const Color(0xFF8E24AA),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Eye Wears',
            );
          },
        ),

        /// 📦 PACK
        CategoryTile(
          imageLink: 'https://i.imgur.com/BPvKeXl.png',
          label: 'Pack',
          backgroundColor: const Color(0xFFFF9800),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Pack',
            );
          },
        ),

        /// 🔸 OTHERS
        CategoryTile(
          imageLink: 'https://i.imgur.com/m65fusg.png',
          label: 'Others',
          backgroundColor: const Color(0xFF78909C),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryDetails,
              arguments: 'Others',
            );
          },
        ),
      ],
    );
  }
}