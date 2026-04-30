// views/cart/cart_page.dart
import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/routes/app_routes.dart';
import 'components/coupon_code_field.dart';
import 'components/items_totals_price.dart';
import 'components/single_cart_item_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    this.isHomePage = false,
  });

  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    // dummy jumlah item (bisa diganti nanti dengan data real/API)
    final int itemCount = 3;

    return Scaffold(
      appBar: isHomePage
          ? null
          : AppBar(
              leading: const AppBackButton(),
              title: const Text('Cart Page'),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDefaults.padding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🛒 Cart Items (lebih scalable)
                ...List.generate(
                  itemCount,
                  (index) => const SingleCartItemTile(),
                ),

                const SizedBox(height: 8),

                /// 🎟 Coupon
                const CouponCodeField(),

                /// 💰 Total Price
                const ItemTotalsAndPrice(),

                /// 🔘 Checkout Button
                Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.checkoutPage,
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
