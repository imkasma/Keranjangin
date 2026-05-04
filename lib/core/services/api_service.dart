import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart'; // Pastikan path model benar

class ApiService {
  // Ganti sesuai URL yang ada di Hoppscotch kamu
  static const String baseUrl = "ISI_URL_DARI_HOPPSCOTCH_DISINI"; 

  static Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/2026/uts/B/kelompok5/products"),
      );

      if (response.statusCode == 200) {
        // Karena API kamu mengembalikan objek dengan key "data"
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> data = body['data']; 

        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        throw "Gagal mengambil data: ${response.statusCode}";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}