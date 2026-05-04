import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/product_model.dart';
import 'network_image.dart';
import '../../views/home/product_details_page.dart';

class ProductTileSquare extends StatelessWidget {
  const ProductTileSquare({super.key, required this.data});

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        elevation: 2, // 🔥 shadow biar naik
        child: InkWell(
          borderRadius: BorderRadius.circular(16),

          /// 🔥 NAVIGASI KE DETAIL
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailsPage(product: data),
              ),
            );
          },

          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔥 GAMBAR
                Expanded(
                  child: Center(
                    child: NetworkImageWithLoader(
                      data.cover,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                /// 🔥 NAMA PRODUK
                Text(
                  data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                /// 🔥 BERAT
                Text(
                  data.weight,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 6),

                /// ⭐ RATING
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < data.rating
                          ? Icons.star
                          : Icons.star_border,
                      size: 14,
                      color: Colors.orange,
                    ),
                  ),
                ),

                const Spacer(),

                /// 💰 HARGA
                Row(
                  children: [
                    Text(
                      '\$${data.price.toInt()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '\$${data.mainPrice}',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}