class Product {
  final int id;
  final String name;
  final double rating;
  final String description;
  final double price;
  List<String> imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
