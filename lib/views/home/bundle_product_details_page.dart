import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/components/buy_now_row_button.dart';
import '../../core/components/price_and_quantity.dart';
import '../../core/components/review_row_button.dart';
import '../../core/constants/constants.dart';
import '../../core/routes/app_routes.dart';
import 'components/bundle_meta_data.dart';
import 'components/bundle_pack_details.dart';

// model cart
class CartItem {
  final String name;
  final double price;
  final int quantity;
  final List<String> images;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.images,
  });
}

// cart global
List<CartItem> cart = [];

class BundleProductDetailsPage extends StatelessWidget {
  final String name;
  final double price;
  final List<String> images;

  const BundleProductDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = images.isNotEmpty
        ? images.first
        : 'https://i.imgur.com/NOuZzbe.png';

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Bundle Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔥 AMAN (tidak crash)
            Image.network(imageUrl),

            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),

                  PriceAndQuantityRow(
                    currentPrice: price,
                    orginalPrice: price + 10,
                    quantity: 1,
                  ),

                  const SizedBox(height: AppDefaults.padding / 2),
                  const BundleMetaData(),
                  const PackDetails(),
                  const ReviewRowButton(totalStars: 5),
                  const Divider(thickness: 0.1),

                  /// 🔥 BUTTON
                  BuyNowRow(
                    onCartButtonTap: () {
                      cart.add(
                        CartItem(
                          name: name,
                          price: price,
                          quantity: 1,
                          images: images,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ditambahkan ke keranjang"),
                        ),
                      );
                    },
                    onBuyButtonTap: () {
                      Navigator.pushNamed(context, AppRoutes.checkoutPage);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
