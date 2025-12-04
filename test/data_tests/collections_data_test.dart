import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/data/collections_data.dart';

void main() {
  group('Collections Data Tests', () {
    test('collections list is not empty', () {
      expect(collections, isNotEmpty);
      expect(collections.length, greaterThan(0));
    });

    test('each collection has required fields', () {
      for (var collection in collections) {
        expect(collection.id, isNotEmpty);
        expect(collection.name, isNotEmpty);
        expect(collection.imageUrl, isNotEmpty);
        expect(collection.description, isNotEmpty);
        expect(collection.productCount, greaterThan(0));
      }
    });

    test('collection IDs are unique', () {
      final ids = collections.map((c) => c.id).toList();
      final uniqueIds = ids.toSet();
      expect(ids.length, equals(uniqueIds.length));
    });

    test('collections have valid product counts', () {
      for (var collection in collections) {
        expect(collection.productCount, greaterThanOrEqualTo(0));
      }
    });

    test('all collections have images', () {
      for (var collection in collections) {
        expect(collection.imageUrl, isNot(isEmpty));
      }
    });
  });
}
