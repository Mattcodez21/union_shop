import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Model Tests', () {
    test('Product can be created with all required fields', () {
      final product = Product(
        id: '123',
        name: 'Test T-Shirt',
        description: 'A comfortable test t-shirt',
        price: 29.99,
        category: 'Clothing',
        sizes: ['S', 'M', 'L'],
        colors: ['Red', 'Blue'],
        imageUrls: ['https://example.com/image1.jpg'],
      );

      expect(product.id, '123');
      expect(product.name, 'Test T-Shirt');
      expect(product.description, 'A comfortable test t-shirt');
      expect(product.price, 29.99);
      expect(product.originalPrice, isNull);
      expect(product.category, 'Clothing');
      expect(product.sizes, ['S', 'M', 'L']);
      expect(product.colors, ['Red', 'Blue']);
      expect(product.imageUrls, ['https://example.com/image1.jpg']);
    });

    test('Product can be created with originalPrice for sale items', () {
      final product = Product(
        id: '456',
        name: 'Sale Hoodie',
        description: 'Discounted hoodie',
        price: 39.99,
        originalPrice: 59.99,
        category: 'Clothing',
        sizes: ['M', 'L', 'XL'],
        colors: ['Black'],
        imageUrls: ['https://example.com/hoodie.jpg'],
      );

      expect(product.price, 39.99);
      expect(product.originalPrice, 59.99);
    });
  });
}
