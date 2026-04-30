// views/cart/empty_cart_page.dart
import 'package:flutter/material.dart';

import '../../core/components/network_image.dart';
import '../../core/constants/app_defaults.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SizedBox(
        width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          SizedBox(
              width: size.width * 0.7,
            child: const Padding(
              padding: EdgeInsets.all(AppDefaults.padding * 2),
              child: AspectRatio(
                  aspectRatio: 1,
                  child: NetworkImageWithLoader(
                    'https://i.imgur.com/3avdket.png',
                  ),
                ),
              ),
            ),
            Text(
              'Oppss!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
          ),
          const SizedBox(height: 8),
          const Text('Sorry, you have no products in your cart'),
          const Spacer(),

            /// 🔘 Button
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding * 2),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Start Browsing'),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
