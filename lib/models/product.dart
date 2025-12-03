class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice; // Add this field for sale items
  final String category;
  final List<String> sizes;
  final List<String> colors;
  final List<String> imageUrls;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice, // Optional - only for sale items
    required this.category,
    required this.sizes,
    required this.colors,
    required this.imageUrls,
  });
}
