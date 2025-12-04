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

    test('Product can have multiple images', () {
      final product = Product(
        id: '300',
        name: 'Gallery Item',
        description: 'Multiple images',
        price: 40.00,
        category: 'Clothing',
        sizes: ['L'],
        colors: ['Black'],
        imageUrls: ['img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg'],
      );

      expect(product.imageUrls.length, 4);
      expect(product.imageUrls.first, 'img1.jpg');
      expect(product.imageUrls.last, 'img4.jpg');
    });

    test('Product can have empty sizes list', () {
      final product = Product(
        id: '400',
        name: 'One Size',
        description: 'No size variations',
        price: 15.00,
        category: 'Accessories',
        sizes: [],
        colors: ['Silver'],
        imageUrls: ['img.jpg'],
      );

      expect(product.sizes, isEmpty);
    });

    test('Product can have empty colors list', () {
      final product = Product(
        id: '500',
        name: 'Single Color',
        description: 'No color options',
        price: 20.00,
        category: 'Basic',
        sizes: ['One Size'],
        colors: [],
        imageUrls: ['img.jpg'],
      );

      expect(product.colors, isEmpty);
    });

    test('Product price can be zero for free items', () {
      final product = Product(
        id: '600',
        name: 'Free Item',
        description: 'Promotional',
        price: 0.00,
        category: 'Promo',
        sizes: ['S'],
        colors: ['White'],
        imageUrls: ['free.jpg'],
      );

      expect(product.price, 0.00);
    });

    test('Product with sale price is cheaper than original', () {
      final product = Product(
        id: '700',
        name: 'On Sale',
        description: 'Discounted',
        price: 30.00,
        originalPrice: 50.00,
        category: 'Sale',
        sizes: ['M'],
        colors: ['Red'],
        imageUrls: ['sale.jpg'],
      );

      expect(product.price, lessThan(product.originalPrice!));
    });

    test('Product fields are accessible', () {
      final product = Product(
        id: 'test-id',
        name: 'Test Name',
        description: 'Test Description',
        price: 99.99,
        category: 'Test Category',
        sizes: ['Test Size'],
        colors: ['Test Color'],
        imageUrls: ['test-url.jpg'],
      );

      // Just verify all fields are accessible and have correct types
      expect(product.id, isA<String>());
      expect(product.name, isA<String>());
      expect(product.description, isA<String>());
      expect(product.price, isA<double>());
      expect(product.originalPrice, anyOf(isNull, isA<double>()));
      expect(product.category, isA<String>());
      expect(product.sizes, isA<List<String>>());
      expect(product.colors, isA<List<String>>());
      expect(product.imageUrls, isA<List<String>>());
    });
  });
}
