class CardModel {
  final String number;
  final String name;
  final String valid;

  CardModel({required this.number, required this.name, required this.valid});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      number: json['number'] ?? '',
      name: json['name'] ?? '',
      valid: json['valid'] ?? '',
    );
  }
}
