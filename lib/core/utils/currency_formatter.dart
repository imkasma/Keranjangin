import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String convertToIdr(num number, int decimalDigits) {
    final format = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: decimalDigits,
    );

    return format.format(number);
  }

  // ✅ FIX: auto tampil ribuan (000) + format benar
  static String toRupiah(double number) {
    return convertToIdr(number, 0);
  }

  // 🔥 OPTIONAL: kalau suatu saat API USD → IDR (tanpa ubah API)
  static const double _rate = 15000;

  static String fromUsd(double usd) {
    final idr = usd * _rate;
    return convertToIdr(idr, 0);
  }
}
