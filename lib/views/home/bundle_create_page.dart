import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/constants.dart';
import 'components/bundle_create_bottom_action_bar.dart';
import 'components/bundle_create_food_categories.dart';
import 'components/product_grid_view.dart';

class BundleCreatePage extends StatelessWidget {
  const BundleCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Create My Pack'),
      ),
      body: Column(
        children: [
          const FoodCategories(),
          const SizedBox(height: AppDefaults.padding / 2),

          /// Grid sudah handle klik sendiri
          const Expanded(child: ProductGridView()),

          const BottomActionBar(),
        ],
      ),
    );
  }
}
