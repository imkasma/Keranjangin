import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/network_image.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/constants/global_data.dart';

class SingleCartItemTile extends StatelessWidget {
  final CartItem item;
  final int index;
  final VoidCallback onDelete;

  const SingleCartItemTile({
    super.key,
    required this.item,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = item.images.isNotEmpty
        ? item.images.first
        : 'https://i.imgur.com/4YEHvGc.png';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding,
        vertical: AppDefaults.padding / 2,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              SizedBox(
                width: 70,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: NetworkImageWithLoader(imageUrl, fit: BoxFit.contain),
                ),
              ),

              const SizedBox(width: 16),

              /// NAME + QTY
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "Qty: ${item.quantity}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcons.addQuantity),
                          constraints: const BoxConstraints(),
                        ),
                        Text(
                          item.quantity.toString(),
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcons.removeQuantity),
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// PRICE + DELETE
              Column(
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    onPressed: onDelete,
                    icon: SvgPicture.asset(AppIcons.delete),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    CurrencyFormatter.toRupiah(item.price),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const Divider(thickness: 0.1),
        ],
      ),
    );
  }
}
