import 'package:flutter/material.dart';

class AppDefaults {
  // Nilai konstanta dasar
  static const double radius = 15.0;
  static const double margin = 15.0;
  static const double padding = 15.0;

  /// Digunakan untuk Border Radius
  /// Gunakan 'final' karena BorderRadius.circular adalah runtime-computed
  static final BorderRadius borderRadius = BorderRadius.circular(radius);

  /// Digunakan untuk Bottom Sheet
  static const BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Digunakan untuk Top Sheet
  static const BorderRadius topSheetRadius = BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Default Box Shadow untuk container
  /// Memperbaiki warning color dengan sintaks Flutter terbaru (SDK 3.27+)
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      // Jika masih kuning, ganti ke: Colors.black.withOpacity(0.04)
      color: Colors.black.withValues(alpha: 0.04), 
    ),
  ];

  static const Duration duration = Duration(milliseconds: 300);
}