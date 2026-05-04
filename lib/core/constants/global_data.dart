import '../models/product_model.dart';
import '../models/bundle_model.dart';

/// =======================
/// CART MODEL
/// =======================
class CartItem {
  final String name;
  final double price;
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
}

/// =======================
/// WISHLIST MODEL
/// =======================
class WishlistItem {
  final String name;
  final double price;
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
}

/// =======================
/// GLOBAL STATE (TEMP DATA)
/// =======================
List<CartItem> cart = [];
List<WishlistItem> wishlist = [];
