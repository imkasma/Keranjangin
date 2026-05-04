import 'package:flutter/material.dart';

import '../../core/constants/global_data.dart';
import '../home/product_details_page.dart';
import '../home/bundle_details_page.dart';
import '../../core/utils/currency_formatter.dart';
import 'empty_save_page.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key, this.isHomePage = false});

  final bool isHomePage;

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    if (wishlist.isEmpty) {
      return const EmptySavePage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        automaticallyImplyLeading: false,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final item = wishlist[index];

          return Card(
            child: ListTile(
              onTap: () {
                // ================= PRODUCT =================
                if (item.product != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductDetailsPage(product: item.product!),
                    ),
                  );
                  return;
                }

                // ================= BUNDLE =================
                if (item.bundle != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BundleDetailsPage(bundle: item.bundle!),
                    ),
                  );
                  return;
                }
              },

              leading: Image.network(
                item.images.isNotEmpty
                    ? item.images.first
                    : 'https://i.imgur.com/NOuZzbe.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),

              title: Text(item.name),
              subtitle: Text(CurrencyFormatter.toRupiah(item.price)),

              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  setState(() {
                    wishlist.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
