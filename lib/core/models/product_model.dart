class ProductModel {
  final String name;
  final String weight;
  final String cover;
  final List<String> images;
  final double price;
  final double mainPrice;
  int rating;
  final String category;

  ProductModel({
    required this.name,
    this.weight = '',
    required this.cover,
    this.images = const [],
    required this.price,
    double? mainPrice,
    this.rating = 0,
    this.category = 'General',
  }) : mainPrice = mainPrice ?? price;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final image = json['image'] ?? '';

    return ProductModel(
      name: json['name'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0,
      rating: (json['star'] ?? 0).toInt(),

      /// API cuma punya 1 gambar
      cover: image,
      images: image != '' ? [image] : [],

      /// optional (biar ga error walaupun ga ada di API)
      weight: json['weight'] ?? '',
      category: json['category'] ?? 'Food',
      mainPrice: json['mainPrice'] != null
          ? double.tryParse(json['mainPrice'].toString())
          : null,
    );
  }
}
