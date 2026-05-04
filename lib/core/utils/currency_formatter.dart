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

  // OPTIONAL: biar yang lama gak error juga
  static String toRupiah(double number) {
    return convertToIdr(number, 0);
  }
}
