import '../models/dummy_product_model.dart';

/// =======================
/// CART MODEL
/// =======================
class CartItem {
  final String name;
  final double price;
  final int quantity;
  final List<String> images;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.images,
  });
}

/// =======================
/// WISHLIST MODEL (FIX UTAMA)
/// =======================
class WishlistItem {
  final String name;
  final double price;
  final List<String> images;

  /// 🔥 NULL = bundle, ADA = product
  final ProductModel? product;

  WishlistItem({
    required this.name,
    required this.price,
    required this.images,
    this.product,
  });
}

/// =======================
/// GLOBAL STATE
/// =======================
List<CartItem> cart = [];
List<WishlistItem> wishlist = [];
