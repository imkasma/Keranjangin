import 'package:flutter/material.dart';

import '../../core/constants/global_data.dart';
import '../home/product_details_page.dart';
import '../home/bundle_product_details_page.dart';
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
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              onTap: () {
                /// 🔥 FIX: CEK DARI product
                if (item.product != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductDetailsPage(product: item.product!),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BundleProductDetailsPage(
                        name: item.name,
                        price: item.price,
                        images: item.images,
                      ),
                    ),
                  );
                }
              },

              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.images.isNotEmpty
                      ? item.images[0]
                      : 'https://i.imgur.com/NOuZzbe.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              title: Text(
                item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              subtitle: Text("\$${item.price}"),

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
