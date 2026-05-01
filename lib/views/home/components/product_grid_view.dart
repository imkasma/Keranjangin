import 'package:flutter/material.dart';

import '../../../core/components/product_tile_square.dart';
import '../../../core/constants/constants.dart';
import '../bundle_product_details_page.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Dummy.products;

    return GridView.builder(
      padding: const EdgeInsets.only(top: AppDefaults.padding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BundleProductDetailsPage(
                  name: product.name,
                  price: product.price,
                  images: (product.images.isNotEmpty)
                      ? product.images
                      : ['https://i.imgur.com/NOuZzbe.png'],
                ),
              ),
            );
          },
          child: ProductTileSquare(data: product),
        );
      },
    );
  }
}
