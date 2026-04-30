import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';
import 'social_icons.dart';

class LoginOrSignUpPage extends StatelessWidget {
  const LoginOrSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            // LOGO / TITLE
            Column(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 80,
                  color: Color(0xFF2E7D32),
                ),
                const SizedBox(height: 10),
                Text(
                  "Keranjangin",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2E7D32),
                  ),
                ),
                Text(
                  "Aja dulu",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // LOGIN EMAIL
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: const Text('Login With Email'),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text('OR', style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),
            const SocialIcons(),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
