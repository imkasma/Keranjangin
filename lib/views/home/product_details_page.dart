import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/components/buy_now_row_button.dart';
import '../../core/components/price_and_quantity.dart';
import '../../core/components/product_images_slider.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/constants/global_data.dart';
import '../../core/routes/app_routes.dart';
import '../../core/models/product_model.dart';
import '../../core/utils/currency_formatter.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late int rating;
  bool isFavorite = false;

  // FIX QUANTITY
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    rating = widget.product.rating;

    isFavorite = wishlist.any((item) => item.product == widget.product);
  }

  void toggleWishlist() {
    setState(() {
      if (isFavorite) {
        wishlist.removeWhere((item) => item.product == widget.product);
      } else {
        wishlist.add(
          WishlistItem(
            name: widget.product.name,
            price: widget.product.price,
            images: widget.product.images,
            product: widget.product,
          ),
        );
      }

      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite ? "Ditambahkan ke wishlist ❤️" : "Dihapus dari wishlist",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.product.images.isNotEmpty
        ? widget.product.images
        : ['https://i.imgur.com/NOuZzbe.png'];

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Product Details'),
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

      // ================= BOTTOM BUTTON =================
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: BuyNowRow(
            onCartButtonTap: () {
              cart.add(
                CartItem(
                  name: widget.product.name,
                  price: widget.product.price,
                  quantity: quantity, // 🔥 FIX INI
                  images: images,
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Produk ditambahkan ke keranjang"),
                ),
              );
            },
            onBuyButtonTap: () {
              Navigator.pushNamed(context, AppRoutes.checkoutPage);
            },
          ),
        ),
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagesSlider(
              images: images,
              isFavorite: isFavorite,
              onFavoriteTap: toggleWishlist,
            ),

            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text('Weight: ${widget.product.weight}'),

                  const SizedBox(height: 12),

                  Text(
                    'Review',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            rating = index + 1;
                            widget.product.rating = rating;
                          });
                        },
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

            // ================= PRICE + QUANTITY FIX =================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding,
              ),
              child: PriceAndQuantityRow(
                currentPrice: widget.product.price,
                orginalPrice: widget.product.mainPrice,
                quantity: quantity,
                onIncrease: () {
                  setState(() {
                    quantity++;
                  });
                },
                onDecrease: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Details',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Duis aute veniam veniam qui aliquip irure duis sint magna occaecat dolore nisi culpa do.',
                  ),
                ],
              ),
            ),

            const Divider(thickness: 0.1),
          ],
        ),
      ),
    );
  }
}
