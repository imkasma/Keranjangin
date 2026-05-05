import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/card_model.dart';

class CardViewModel extends ChangeNotifier {
  CardModel? card;
  bool isLoading = false;

  Future<void> fetchCard() async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await ApiService.getCards();

      // 🔥 DEBUG: lihat hasil dari API
      print("CARD RESULT (MODEL): $result");

      card = result;
    } catch (e) {
      print("ERROR CARD: $e");
      card = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
