import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';
import '../models/card_model.dart';

class ApiService {
  static const String baseUrl =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok5";

  // ================== PRODUCT (JANGAN DIUBAH) ==================
  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    print("PRODUCT RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final data = body['data'];
      if (data == null) return [];

      return List<ProductModel>.from(data.map((e) => ProductModel.fromJson(e)));
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }

  // ================== CARD (FIXED) ==================
  static Future<CardModel?> getCards() async {
    final response = await http.get(Uri.parse('$baseUrl/card'));

    print("CARD RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final data = body['data'];

      // API kamu OBJECT, bukan LIST
      if (data == null || data is! Map<String, dynamic>) {
        print("DATA CARD KOSONG / FORMAT SALAH");
        return null;
      }

      return CardModel.fromJson(data);
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }

  // ================== PROFILE (BARU) ==================
  static Future<Map<String, dynamic>?> getProfile() async {
    final response = await http.get(Uri.parse('$baseUrl/profile'));

    print("PROFILE RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final data = body['data'];

      // biasanya profile bentuknya object
      if (data == null || data is! Map<String, dynamic>) {
        print("DATA PROFILE KOSONG / FORMAT SALAH");
        return null;
      }

      return data;
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }
}