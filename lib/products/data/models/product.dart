class Product {
  final String? imagePath, title, description;
  final double price, rating;
  final int id;

  Product(
      {required this.imagePath,
      required this.title,
      required this.description,
      required this.price,
      required this.rating,
      this.id=0});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        imagePath: json["image"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"]["rate"]);
  }
}