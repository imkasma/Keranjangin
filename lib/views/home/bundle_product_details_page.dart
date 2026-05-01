import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/components/buy_now_row_button.dart';
import '../../core/components/price_and_quantity.dart';
import '../../core/constants/constants.dart';
import '../../core/constants/global_data.dart';
import '../../core/routes/app_routes.dart';
import 'components/bundle_meta_data.dart';
import 'components/bundle_pack_details.dart';

class BundleProductDetailsPage extends StatefulWidget {
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
  State<BundleProductDetailsPage> createState() =>
      _BundleProductDetailsPageState();
}

class _BundleProductDetailsPageState extends State<BundleProductDetailsPage> {
  int rating = 3;

  /// CEK FAVORITE (KHUSUS BUNDLE = product null)
  bool get isFavorite =>
      wishlist.any((item) => item.name == widget.name && item.product == null);

  /// TOGGLE WISHLIST
  void toggleWishlist() {
    setState(() {
      if (isFavorite) {
        wishlist.removeWhere(
          (item) => item.name == widget.name && item.product == null,
        );
      } else {
        wishlist.add(
          WishlistItem(
            name: widget.name,
            price: widget.price,
            images: widget.images,
            product: null, // penanda bundle
          ),
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite ? "Dihapus dari wishlist" : "Ditambahkan ke wishlist ❤️",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.images.isNotEmpty
        ? widget.images.first
        : 'https://i.imgur.com/NOuZzbe.png';

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Bundle Details'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// =====================
            /// IMAGE + LOVE (ATAS)
            /// =====================
            Stack(
              children: [
                Image.network(imageUrl),

                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: toggleWishlist,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// =====================
                  /// TITLE + LOVE (BAWAH)
                  /// =====================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.name,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),

                      IconButton(
                        onPressed: toggleWishlist,
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// RATING
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        icon: Icon(
                          Icons.star,
                          color: index < rating ? Colors.orange : Colors.grey,
                        ),
                      );
                    }),
                  ),

                  PriceAndQuantityRow(
                    currentPrice: widget.price,
                    orginalPrice: widget.price + 10,
                    quantity: 1,
                  ),

                  const SizedBox(height: AppDefaults.padding / 2),
                  const BundleMetaData(),
                  const PackDetails(),
                  const Divider(thickness: 0.1),

                  /// =====================
                  /// BUTTON
                  /// =====================
                  BuyNowRow(
                    onCartButtonTap: () {
                      cart.add(
                        CartItem(
                          name: widget.name,
                          price: widget.price,
                          quantity: 1,
                          images: widget.images,
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
