import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import '../models/dummy.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchAllProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      // 1. Ambil dari API
      final apiProducts = await ApiService.getProducts();

      // 2. Gabungkan API + Dummy
      _products = [...apiProducts, ...Dummy.products];
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // OPTIONAL: filter kategori biar UI gampang
  List<ProductModel> getByCategory(String category) {
    return _products.where((item) => item.category == category).toList();
  }
}
