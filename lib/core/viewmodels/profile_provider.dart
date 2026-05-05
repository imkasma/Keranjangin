import 'package:flutter/material.dart';
import 'package:keranjangin/core/services/api_service.dart';

class ProfileViewModel extends ChangeNotifier {
  Map<String, dynamic>? _profile;
  bool _isLoading = false;
  String? _error;

  // ================== GETTERS ==================
  Map<String, dynamic>? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // ================== FETCH PROFILE ==================
  Future<void> fetchProfile() async {
    // 🛑 cegah fetch berkali-kali
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await ApiService.getProfile();

      if (data == null) {
        _error = "Data profile kosong";
        _profile = null;
      } else {
        _profile = data;
      }
    } catch (e) {
      _error = e.toString();
      _profile = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  // ================== OPTIONAL: REFRESH ==================
  Future<void> refreshProfile() async {
    await fetchProfile();
  }
}