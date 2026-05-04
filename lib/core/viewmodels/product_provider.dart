import 'package:flutter/material.dart';
import '../models/product_model.dart'; // Sesuaikan path model kamu
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchAllProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Memanggil ApiService yang baru kita buat
      _products = await ApiService.getProducts();
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
