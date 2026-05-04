import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String url =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok5/products";

  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse(url));

    print("RESPONSE: ${response.body}"); // 🔥 DEBUG WAJIB

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      List<dynamic> data = body['data'];

      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }
}
