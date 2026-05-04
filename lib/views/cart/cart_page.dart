import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/constants/global_data.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/currency_formatter.dart';
import 'components/coupon_code_field.dart';
import 'components/single_cart_item_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, this.isHomePage = false});

  final bool isHomePage;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = cart.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return Scaffold(
      appBar: widget.isHomePage
          ? null
          : AppBar(
              leading: const AppBackButton(),
              title: const Text('Cart Page'),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// LIST CART
              if (cart.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Keranjang masih kosong"),
                )
              else
                ...cart.asMap().entries.map(
                  (entry) => SingleCartItemTile(
                    item: entry.value,
                    index: entry.key,
                    onDelete: () {
                      setState(() {
                        cart.removeAt(entry.key);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item dihapus")),
                      );
                    },
                  ),
                ),

              const CouponCodeField(),

              /// TOTAL
              Padding(
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Text(
                  "Total: ${CurrencyFormatter.toRupiah(total)}",
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
