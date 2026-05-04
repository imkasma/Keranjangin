import 'package:flutter/material.dart';

import '../../../core/components/product_tile_square.dart';
import '../../../core/constants/constants.dart';
import '../../../core/models/bundle_model.dart';
import '../bundle_details_page.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Dummy.products;

    return GridView.builder(
      padding: const EdgeInsets.only(top: AppDefaults.padding),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BundleDetailsPage(
                  bundle: BundleModel(
                    name: product.name,
                    cover: product.images.isNotEmpty
                        ? product.images.first
                        : 'https://i.imgur.com/NOuZzbe.png',
                    itemNames: [],
                    price: product.price,
                    mainPrice: product.mainPrice,
                  ),
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
