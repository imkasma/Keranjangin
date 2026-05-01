import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/routes/app_routes.dart';
import '../home/bundle_product_details_page.dart'; // ambil cart
import 'components/coupon_code_field.dart';
import 'components/single_cart_item_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, this.isHomePage = false});

  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    // 🔥 hitung total
    double total = cart.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return Scaffold(
      appBar: isHomePage
          ? null
          : AppBar(
              leading: const AppBackButton(),
              title: const Text('Cart Page'),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 🔥 LIST ITEM DARI CART
              if (cart.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Keranjang masih kosong"),
                )
              else
                ...cart.asMap().entries.map(
                  (entry) =>
                      SingleCartItemTile(item: entry.value, index: entry.key),
                ),

              const CouponCodeField(),

              /// 🔥 TOTAL HARGA
              Padding(
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Text(
                  "Total: \$${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: ElevatedButton(
                    onPressed: cart.isEmpty
                        ? null
                        : () {
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
    );
  }
}
