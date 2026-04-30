// views/cart/empty_cart_page_2.dart
import 'package:flutter/material.dart';

import '../../core/components/network_image.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/routes/app_routes.dart';

class EmptyCartPageSecond extends StatelessWidget {
  const EmptyCartPageSecond({super.key});

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

            /// 🖼 Image
            SizedBox(
              width: size.width * 0.7,
              child: const Padding(
                padding: EdgeInsets.all(AppDefaults.padding * 2),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: NetworkImageWithLoader(
                    'https://i.imgur.com/znE8Gir.png',
                  ),
                ),
              ),
            ),

            /// 📝 Title
            Text(
              'Oppss!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),

            const SizedBox(height: 8),

            /// 📄 Subtitle
            const Text(
              'Sorry, you have no products in your cart',
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            /// 🔘 Button
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding * 2),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.home, // sesuaikan dengan route kamu
                    );
                  },
                  child: const Text('Start Browsing'),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}