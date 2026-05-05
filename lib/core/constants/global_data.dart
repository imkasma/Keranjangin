import 'package:keranjangin/core/utils/currency_formatter.dart';

import '../models/product_model.dart';
import '../models/bundle_model.dart';
import '../utils/currency_formatter.dart';

/// =======================
/// CART MODEL
/// =======================
class CartItem {
  final String name;
  final double price; // tetap USD dari API
  int quantity;
  final List<String> images;

  final ProductModel? product;
  final BundleModel? bundle;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.images,
    this.product,
    this.bundle,
  });

  /// 🔥 helper convert tanpa ubah data asli
  double get priceInIdr => price * GlobalData.usdToIdr;

  String get priceFormatted => CurrencyFormatter.toRupiah(priceInIdr);
}

/// =======================
/// WISHLIST MODEL
/// =======================
class WishlistItem {
  final String name;
  final double price; // tetap USD dari API
  final List<String> images;

  final ProductModel? product;
  final BundleModel? bundle;

  WishlistItem({
    required this.name,
    required this.price,
    required this.images,
    this.product,
    this.bundle,
  });

  /// 🔥 helper convert tanpa ubah data asli
  double get priceInIdr => price * GlobalData.usdToIdr;

  String get priceFormatted => CurrencyFormatter.toRupiah(priceInIdr);
}

/// =======================
/// GLOBAL STATE (TEMP DATA)
/// =======================
List<CartItem> cart = [];
List<WishlistItem> wishlist = [];

/// =======================
/// GLOBAL CONFIG
/// =======================
class GlobalData {
  static const double usdToIdr = 15000;
}
