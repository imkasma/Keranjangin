import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/constants.dart';
import '../models/bundle_model.dart';
import '../../views/home/bundle_details_page.dart';
import '../utils/currency_formatter.dart';

class BundleTileSquare extends StatelessWidget {
  const BundleTileSquare({super.key, required this.data});

  final BundleModel data;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.scaffoldBackground,
      borderRadius: AppDefaults.borderRadius,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => BundleDetailsPage(bundle: data)),
          );
        },
        borderRadius: AppDefaults.borderRadius,
        child: Container(
          width: 176,
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: AppColors.placeholder),
            borderRadius: AppDefaults.borderRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CachedNetworkImage(
                    imageUrl: data.cover,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                data.name,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              Text(
                data.itemNames.join(', '),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Text(
                    CurrencyFormatter.toRupiah(data.price),
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.black),
                  ),

                  const SizedBox(width: 4),

                  Text(
                    CurrencyFormatter.toRupiah(data.mainPrice),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
