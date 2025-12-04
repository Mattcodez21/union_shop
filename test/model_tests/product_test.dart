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

    test('Product originalPrice can be null', () {
      final product = Product(
        id: '789',
        name: 'Regular Item',
        description: 'Not on sale',
        price: 50.00,
        category: 'Regular',
        sizes: ['M'],
        colors: ['White'],
        imageUrls: ['image.jpg'],
      );

      expect(product.originalPrice, isNull);
    });

    test('Product can have multiple sizes', () {
      final product = Product(
        id: '100',
        name: 'Multi-Size',
        description: 'Many sizes',
        price: 25.00,
        category: 'Clothing',
        sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        colors: ['Black'],
        imageUrls: ['img.jpg'],
      );

      expect(product.sizes.length, 6);
      expect(product.sizes, contains('XS'));
      expect(product.sizes, contains('XXL'));
    });

    test('Product can have multiple colors', () {
      final product = Product(
        id: '200',
        name: 'Colorful Item',
        description: 'Multiple colors',
        price: 30.00,
        category: 'Clothing',
        sizes: ['M'],
        colors: ['Red', 'Blue', 'Green', 'Yellow'],
        imageUrls: ['img.jpg'],
      );

      expect(product.colors.length, 4);
      expect(product.colors, containsAll(['Red', 'Blue', 'Green', 'Yellow']));
    });
  });
}
