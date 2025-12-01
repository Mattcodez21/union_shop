class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final List<String> sizes;
  final List<String> colors;
  final List<String> imageUrls;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.sizes,
    required this.colors,
    required this.imageUrls,
  });
}
