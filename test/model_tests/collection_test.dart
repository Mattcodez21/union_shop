import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection.dart';

void main() {
  group('Collection Model Tests', () {
    test('Collection can be created with all required fields', () {
      final collection = Collection(
        id: 'test-1',
        name: 'Test Collection',
        imageUrl: 'test.jpg',
        description: 'Test description',
        productCount: 5,
      );

      expect(collection.id, equals('test-1'));
      expect(collection.name, equals('Test Collection'));
      expect(collection.imageUrl, equals('test.jpg'));
      expect(collection.description, equals('Test description'));
      expect(collection.productCount, equals(5));
    });

    test('Collection fields are accessible', () {
      final collection = Collection(
        id: 'id',
        name: 'name',
        imageUrl: 'image',
        description: 'desc',
        productCount: 10,
      );

      expect(collection.id, isA<String>());
      expect(collection.name, isA<String>());
      expect(collection.imageUrl, isA<String>());
      expect(collection.description, isA<String>());
      expect(collection.productCount, isA<int>());
    });

    test('Collection can have zero products', () {
      final collection = Collection(
        id: 'empty',
        name: 'Empty',
        imageUrl: 'img',
        description: 'desc',
        productCount: 0,
      );

      expect(collection.productCount, equals(0));
    });

    test('Collection product count can be large', () {
      final collection = Collection(
        id: 'big',
        name: 'Big',
        imageUrl: 'img',
        description: 'desc',
        productCount: 1000,
      );

      expect(collection.productCount, equals(1000));
    });
  });
}
