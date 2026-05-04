import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/components/buy_now_row_button.dart';
import '../../core/components/price_and_quantity.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/constants/global_data.dart';
import '../../core/models/bundle_model.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/currency_formatter.dart';

class BundleDetailsPage extends StatefulWidget {
  final BundleModel bundle;

  const BundleDetailsPage({super.key, required this.bundle});

  @override
  State<BundleDetailsPage> createState() => _BundleDetailsPageState();
}

class _BundleDetailsPageState extends State<BundleDetailsPage> {
  int rating = 4;
  bool isFavorite = false;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    isFavorite = wishlist.any((e) => e.name == widget.bundle.name);
  }

  void toggleWishlist() {
    setState(() {
      if (isFavorite) {
        wishlist.removeWhere((e) => e.name == widget.bundle.name);
      } else {
        wishlist.add(
          WishlistItem(
            name: widget.bundle.name,
            price: widget.bundle.price,
            images: [widget.bundle.cover],
            product: null,
          ),
        );
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final images = [widget.bundle.cover];

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(widget.bundle.name),
        actions: [
          IconButton(
            onPressed: toggleWishlist,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: BuyNowRow(
            onCartButtonTap: () {
              cart.add(
                CartItem(
                  name: widget.bundle.name,
                  price: widget.bundle.price,
                  quantity: quantity,
                  images: images,
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Bundle masuk keranjang")),
              );
            },
            onBuyButtonTap: () {
              Navigator.pushNamed(context, AppRoutes.checkoutPage);
            },
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.bundle.cover, height: 260, fit: BoxFit.cover),

            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.bundle.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...widget.bundle.itemNames.map(
                    (e) => Row(
                      children: [
                        const Icon(Icons.check, color: Colors.green),
                        const SizedBox(width: 6),
                        Text(e),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () => setState(() => rating = index + 1),
                        icon: Icon(
                          Icons.star,
                          color: index < rating ? Colors.orange : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding,
              ),
              child: PriceAndQuantityRow(
                currentPrice: widget.bundle.price,
                orginalPrice: widget.bundle.mainPrice,
                quantity: quantity,
                onIncrease: () => setState(() => quantity++),
                onDecrease: () {
                  if (quantity > 1) setState(() => quantity--);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
