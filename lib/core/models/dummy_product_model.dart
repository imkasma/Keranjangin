class ProductModel {
  String name;
  String weight;
  String cover;
  List<String> images;
  double price;
  double mainPrice;
  int rating; // TAMBAH INI

  ProductModel({
    required this.name,
    required this.weight,
    required this.cover,
    required this.images,
    required this.price,
    required this.mainPrice,
    this.rating = 0, // default
  });
}
