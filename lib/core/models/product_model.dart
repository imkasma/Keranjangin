class ProductModel {
  String name;
  String weight;
  String cover;
  List<String> images;
  double price;
  double mainPrice;
  int rating;
  String category;

  ProductModel({
    required this.name,
    required this.weight,
    required this.cover,
    required this.images,
    required this.price,
    required this.mainPrice,
    this.rating = 0,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] ?? '',
      weight: json['weight'] ?? '1kg',
      // Cek apakah API pakai key 'image' atau 'cover'
      cover: json['image'] ?? json['cover'] ?? '',
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      price: (json['price'] ?? 0).toDouble(),
      mainPrice: (json['mainPrice'] ?? json['price'] ?? 0).toDouble(),
      rating: json['star']?.toInt() ?? 0,
      category: json['category'] ?? 'General',
    );
  }
}

// List<ProductModel> dummyProducts = [

//   /// 🌱 VEGETABLES
//   ProductModel(name: "Carrot", weight: "1kg", cover: "assets/images/carrot.png", images: [], price: 5, mainPrice: 7, category: "Vegetables"),
//   ProductModel(name: "Broccoli", weight: "1kg", cover: "assets/images/broccoli.png", images: [], price: 6, mainPrice: 8, category: "Vegetables"),
//   ProductModel(name: "Tomato", weight: "1kg", cover: "assets/images/tomato.png", images: [], price: 4, mainPrice: 6, category: "Vegetables"),
//   ProductModel(name: "Spinach", weight: "1 bunch", cover: "assets/images/spinach.png", images: [], price: 3, mainPrice: 5, category: "Vegetables"),
//   ProductModel(name: "Chili", weight: "500g", cover: "assets/images/chili.png", images: [], price: 4, mainPrice: 6, category: "Vegetables"),
//   ProductModel(name: "Cabbage", weight: "1kg", cover: "assets/images/cabbage.png", images: [], price: 3, mainPrice: 5, category: "Vegetables"),

//   /// 🥩 MEAT AND FISH
//   ProductModel(name: "Beef", weight: "1kg", cover: "assets/images/beef.png", images: [], price: 15, mainPrice: 18, category: "Meat And Fish"),
//   ProductModel(name: "Chicken", weight: "1kg", cover: "assets/images/chicken.png", images: [], price: 12, mainPrice: 15, category: "Meat And Fish"),
//   ProductModel(name: "Salmon", weight: "500g", cover: "assets/images/salmon.png", images: [], price: 20, mainPrice: 25, category: "Meat And Fish"),
//   ProductModel(name: "Shrimp", weight: "500g", cover: "assets/images/shrimp.png", images: [], price: 14, mainPrice: 18, category: "Meat And Fish"),
//   ProductModel(name: "Tuna", weight: "1kg", cover: "assets/images/tuna.png", images: [], price: 17, mainPrice: 20, category: "Meat And Fish"),
//   ProductModel(name: "Crab", weight: "1kg", cover: "assets/images/crab.png", images: [], price: 18, mainPrice: 22, category: "Meat And Fish"),

//   /// 💊 MEDICINE
//   ProductModel(name: "Paracetamol", weight: "10 tablets", cover: "assets/images/medicine.png", images: [], price: 2, mainPrice: 3, category: "Medicine"),
//   ProductModel(name: "Vitamin C", weight: "10 tablets", cover: "assets/images/medicine.png", images: [], price: 3, mainPrice: 5, category: "Medicine"),
//   ProductModel(name: "Cough Syrup", weight: "100ml", cover: "assets/images/medicine.png", images: [], price: 5, mainPrice: 7, category: "Medicine"),
//   ProductModel(name: "Antacid", weight: "10 tablets", cover: "assets/images/medicine.png", images: [], price: 3, mainPrice: 5, category: "Medicine"),
//   ProductModel(name: "Pain Relief", weight: "1 tube", cover: "assets/images/medicine.png", images: [], price: 4, mainPrice: 6, category: "Medicine"),
//   ProductModel(name: "Antibiotic", weight: "10 tablets", cover: "assets/images/medicine.png", images: [], price: 6, mainPrice: 8, category: "Medicine"),

//   /// 👶 BABY CARE
//   ProductModel(name: "Baby Diapers", weight: "20 pcs", cover: "assets/images/baby.png", images: [], price: 10, mainPrice: 13, category: "Baby Care"),
//   ProductModel(name: "Baby Lotion", weight: "200ml", cover: "assets/images/baby.png", images: [], price: 6, mainPrice: 8, category: "Baby Care"),
//   ProductModel(name: "Baby Oil", weight: "150ml", cover: "assets/images/baby.png", images: [], price: 5, mainPrice: 7, category: "Baby Care"),
//   ProductModel(name: "Baby Powder", weight: "100g", cover: "assets/images/baby.png", images: [], price: 4, mainPrice: 6, category: "Baby Care"),
//   ProductModel(name: "Milk Formula", weight: "400g", cover: "assets/images/baby.png", images: [], price: 12, mainPrice: 15, category: "Baby Care"),
//   ProductModel(name: "Baby Shampoo", weight: "200ml", cover: "assets/images/baby.png", images: [], price: 6, mainPrice: 8, category: "Baby Care"),

//   /// 🏢 OFFICE SUPPLIES
//   ProductModel(name: "Notebook", weight: "1 pcs", cover: "assets/images/office.png", images: [], price: 2, mainPrice: 3, category: "Office Supplies"),
//   ProductModel(name: "Pen", weight: "1 pcs", cover: "assets/images/office.png", images: [], price: 1, mainPrice: 2, category: "Office Supplies"),
//   ProductModel(name: "Stapler", weight: "1 pcs", cover: "assets/images/office.png", images: [], price: 4, mainPrice: 6, category: "Office Supplies"),
//   ProductModel(name: "Marker", weight: "1 pcs", cover: "assets/images/office.png", images: [], price: 2, mainPrice: 3, category: "Office Supplies"),
//   ProductModel(name: "Paper A4", weight: "1 pack", cover: "assets/images/office.png", images: [], price: 5, mainPrice: 7, category: "Office Supplies"),
//   ProductModel(name: "Envelope", weight: "10 pcs", cover: "assets/images/office.png", images: [], price: 3, mainPrice: 5, category: "Office Supplies"),

//   /// 💄 BEAUTY
//   ProductModel(name: "Lipstick", weight: "1 pcs", cover: "assets/images/beauty.png", images: [], price: 8, mainPrice: 10, category: "Beauty"),
//   ProductModel(name: "Face Wash", weight: "100ml", cover: "assets/images/beauty.png", images: [], price: 6, mainPrice: 8, category: "Beauty"),
//   ProductModel(name: "Perfume", weight: "50ml", cover: "assets/images/beauty.png", images: [], price: 15, mainPrice: 20, category: "Beauty"),
//   ProductModel(name: "Moisturizer", weight: "100ml", cover: "assets/images/beauty.png", images: [], price: 10, mainPrice: 12, category: "Beauty"),
//   ProductModel(name: "Sunscreen", weight: "100ml", cover: "assets/images/beauty.png", images: [], price: 9, mainPrice: 11, category: "Beauty"),
//   ProductModel(name: "Foundation", weight: "1 pcs", cover: "assets/images/beauty.png", images: [], price: 12, mainPrice: 15, category: "Beauty"),

// ];
