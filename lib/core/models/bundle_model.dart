class BundleModel {
  final String name;
  final String cover;
  final List<String> itemNames;
  final double price;
  final double mainPrice;
  final int rating;

  BundleModel({
    required this.name,
    required this.cover,
    required this.itemNames,
    required this.price,
    required this.mainPrice,
    this.rating = 0,
  });

  /// 🔥 helper: cek ada diskon atau tidak
  bool get hasDiscount => mainPrice > price;
}
