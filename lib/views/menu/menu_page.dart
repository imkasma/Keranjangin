import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/routes/app_routes.dart';
import 'components/category_tile.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF7F8FA),
        child: Column(
          children: [
            const SizedBox(height: 24),

            Text(
              'Choose a category',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 16),

            const CateogoriesGrid(),
          ],
        ),
      ),
    );
  }
}

class CateogoriesGrid extends StatelessWidget {
  const CateogoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(12),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 14,
        childAspectRatio: 0.9,
        children: [
          /// 🌱 VEGETABLES (HIJAU TUA)
          CategoryTile(
            imageLink: 'https://i.imgur.com/tGChxbZ.png',
            label: 'Vegetables',
            backgroundColor: const Color.fromARGB(255, 25, 119, 31),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Vegetables');
            },
          ),

          /// 🥩 MEAT (BIRU MUDA TERANG)
          CategoryTile(
            imageLink: 'https://i.imgur.com/yOFxoIP.png',
            label: 'Meat And Fish',
            backgroundColor: const Color(0xFF4FC3F7),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Meat And Fish');
            },
          ),

          /// 💊 MEDICINE (MERAH)
          CategoryTile(
            imageLink: 'https://i.imgur.com/GPsRaFC.png',
            label: 'Medicine',
            backgroundColor: const Color(0xFFE53935),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Medicine');
            },
          ),

          /// 👶 BABY CARE (KUNING)
          CategoryTile(
            imageLink: 'https://i.imgur.com/mGRqfnc.png',
            label: 'Baby Care',
            backgroundColor: const Color(0xFFFFD54F),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Baby Care');
            },
          ),

          /// 🏢 OFFICE (BIRU TUA)
          CategoryTile(
            imageLink: 'https://i.imgur.com/fwyz4oC.png',
            label: 'Office Supplies',
            backgroundColor: const Color.fromARGB(255, 75, 115, 176),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Office Supplies');
            },
          ),

          /// 💄 BEAUTY (PINK TERANG)
          CategoryTile(
            imageLink: 'https://i.imgur.com/DNr8a6R.png',
            label: 'Beauty',
            backgroundColor: const Color(0xFFFF4081),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Beauty');
            },
          ),

          /// 🏋️ GYM (COKLAT)
          CategoryTile(
            imageLink: 'https://i.imgur.com/O2ZX5nR.png',
            label: 'Gym Equipment',
            backgroundColor: const Color(0xFF6D4C41),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Gym Equipment');
            },
          ),

          /// 🌿 GARDEN (HIJAU TOSCA)
          CategoryTile(
            imageLink: 'https://i.imgur.com/wJBopjL.png',
            label: 'Gardening Tools',
            backgroundColor: const Color.fromARGB(255, 45, 147, 78),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Gardening Tools');
            },
          ),

          /// 🐶 PET (KUNING TERANG)
          CategoryTile(
            imageLink: 'https://i.imgur.com/P4yJA9t.png',
            label: 'Pet Care',
            backgroundColor: const Color(0xFFFFEE58),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Pet Care');
            },
          ),

          /// 👓 EYE WEAR (UNGU)
          CategoryTile(
            imageLink: 'https://i.imgur.com/sxGf76e.png',
            label: 'Eye Wears',
            backgroundColor: const Color.fromARGB(255, 134, 70, 152),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Eye Wears');
            },
          ),

          /// 📦 PACK (OREN)
          CategoryTile(
            imageLink: 'https://i.imgur.com/BPvKeXl.png',
            label: 'Pack',
            backgroundColor: const Color(0xFFFF9800),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Pack');
            },
          ),

          /// 🔸 OTHERS
          CategoryTile(
            imageLink: 'https://i.imgur.com/m65fusg.png',
            label: 'Others',
            backgroundColor: const Color(0xFF78909C),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.categoryDetails,
                  arguments: 'Others');
            },
          ),
        ],
      ),
    );
  }
}