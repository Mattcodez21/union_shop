import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/data/products_data.dart';

void main() {
  group('Products Data Extended Tests', () {
    test('products list has expected minimum size', () {
      expect(products.length, greaterThanOrEqualTo(10));
    });

    test('all products have valid prices', () {
      for (var product in products) {
        expect(product.price, greaterThan(0));
      }
    });

    test('sale products have original price greater than sale price', () {
      final saleProducts = products.where((p) => p.originalPrice != null);
      for (var product in saleProducts) {
        expect(product.originalPrice!, greaterThan(product.price));
      }
    });

    test('all products have at least one image', () {
      for (var product in products) {
        expect(product.imageUrls, isNotEmpty);
        expect(product.imageUrls.first, isNotEmpty);
      }
    });

    test('products have variety of categories', () {
      final categories = products.map((p) => p.category).toSet();
      expect(categories.length, greaterThan(1));
    });

    test('all product names are non-empty', () {
      for (var product in products) {
        expect(product.name, isNotEmpty);
        expect(product.name.length, greaterThan(3));
      }
    });

    test('all product descriptions are non-empty', () {
      for (var product in products) {
        expect(product.description, isNotEmpty);
        expect(product.description.length, greaterThan(10));
      }
    });

    test('products have reasonable price range', () {
      final prices = products.map((p) => p.price).toList();
      final minPrice = prices.reduce((a, b) => a < b ? a : b);
      final maxPrice = prices.reduce((a, b) => a > b ? a : b);

      expect(minPrice, greaterThan(0));
      expect(maxPrice, lessThan(10000));
    });

    test('some products have sizes available', () {
      final productsWithSizes = products.where((p) => p.sizes.isNotEmpty);
      expect(productsWithSizes, isNotEmpty);
    });

    test('some products have colors available', () {
      final productsWithColors = products.where((p) => p.colors.isNotEmpty);
      expect(productsWithColors, isNotEmpty);
    });

    test('products can be filtered by category', () {
      final firstCategory = products.first.category;
      final filtered = products.where((p) => p.category == firstCategory);
      expect(filtered, isNotEmpty);
    });

    test('all product images are valid URLs or paths', () {
      for (var product in products) {
        for (var image in product.imageUrls) {
          expect(image, isNotEmpty);
          expect(image.length, greaterThan(5));
        }
      }
    });

    test('all product IDs are unique', () {
      final ids = products.map((p) => p.id).toList();
      final uniqueIds = ids.toSet();
      expect(ids.length, equals(uniqueIds.length));
    });

    test('products with multiple images have at least 2', () {
      final multiImageProducts = products.where((p) => p.imageUrls.length > 1);
      if (multiImageProducts.isNotEmpty) {
        for (var product in multiImageProducts) {
          expect(product.imageUrls.length, greaterThanOrEqualTo(2));
        }
      }
    });
  });
}
