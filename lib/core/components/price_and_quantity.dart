import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';
import '../utils/currency_formatter.dart';

class PriceAndQuantityRow extends StatelessWidget {
  const PriceAndQuantityRow({
    super.key,
    required this.currentPrice,
    required this.orginalPrice,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  final double currentPrice;
  final double orginalPrice;
  final int quantity;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = orginalPrice > currentPrice;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// PRICE SECTION
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CurrencyFormatter.toRupiah(currentPrice),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            if (hasDiscount)
              Text(
                CurrencyFormatter.toRupiah(orginalPrice),
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
          ],
        ),

        const Spacer(),

        /// QUANTITY CONTROL (FIXED - NO INTERNAL STATE)
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: onDecrease,
                icon: SvgPicture.asset(AppIcons.removeQuantity),
                constraints: const BoxConstraints(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              IconButton(
                onPressed: onIncrease,
                icon: SvgPicture.asset(AppIcons.addQuantity),
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
