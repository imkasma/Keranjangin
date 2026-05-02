class ProductModel {
  String name;
  String weight;
  String cover;
  List<String> images;
  double price;
  double mainPrice;
  int rating;
  String category; // 🔥 TAMBAHKAN INI

  ProductModel({
    required this.name,
    required this.weight,
    required this.cover,
    required this.images,
    required this.price,
    required this.mainPrice,
    this.rating = 0,
    required this.category, // 🔥 WAJIB
  });
}
List<ProductModel> dummyProducts = [
  ProductModel(
    name: "Carrot",
    weight: "1kg",
    cover: "assets/images/carrot.png",
    images: [],
    price: 5,
    mainPrice: 7,
    category: "Vegetables",
  ),
  ProductModel(
    name: "Broccoli",
    weight: "1kg",
    cover: "assets/images/broccoli.png",
    images: [],
    price: 6,
    mainPrice: 8,
    category: "Vegetables",
  ),
  ProductModel(
    name: "Beef",
    weight: "500g",
    cover: "assets/images/beef.png",
    images: [],
    price: 15,
    mainPrice: 18,
    category: "Meat And Fish",
  ),
  ProductModel(
    name: "Ice Cream",
    weight: "250g",
    cover: "assets/images/icecream.png",
    images: [],
    price: 13,
    mainPrice: 15,
    category: "Pack",
  ),
];