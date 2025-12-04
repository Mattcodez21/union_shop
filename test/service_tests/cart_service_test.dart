import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartItem Model Tests', () {
    late Product testProduct;

    setUp(() {
      testProduct = Product(
        id: 'p1',
        name: 'Test Product',
        price: 19.99,
        description: 'Test description',
        category: 'test',
        imageUrls: ['test.jpg'],
        sizes: ['S', 'M', 'L'],
        colors: ['Red', 'Blue'],
      );
    });

    test('CartItem can be created with required fields', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Red',
      );

      expect(item.product.id, 'p1');
      expect(item.quantity, 1);
      expect(item.selectedSize, 'M');
      expect(item.selectedColor, 'Red');
    });

    test('CartItem stores product correctly', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: '',
        selectedColor: '',
      );

      expect(item.product, testProduct);
      expect(item.product.name, 'Test Product');
    });

    test('CartItem stores quantity correctly', () {
      final item = CartItem(
        product: testProduct,
        quantity: 5,
        selectedSize: '',
        selectedColor: '',
      );

      expect(item.quantity, 5);
    });

    test('CartItem can have empty size and color', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: '',
        selectedColor: '',
      );

      expect(item.selectedSize, isEmpty);
      expect(item.selectedColor, isEmpty);
    });

    test('CartItem selectedSize is accessible', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'XL',
        selectedColor: 'Blue',
      );

      expect(item.selectedSize, 'XL');
    });

    test('CartItem selectedColor is accessible', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Green',
      );

      expect(item.selectedColor, 'Green');
    });

    test('CartItem quantity can be modified', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: '',
        selectedColor: '',
      );

      item.quantity = 3;
      expect(item.quantity, 3);
    });

    test('CartItem with different sizes are different', () {
      final item1 = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Red',
      );

      final item2 = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Red',
      );

      expect(item1.selectedSize, isNot(item2.selectedSize));
    });

    test('CartItem with different colors are different', () {
      final item1 = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Red',
      );

      final item2 = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Blue',
      );

      expect(item1.selectedColor, isNot(item2.selectedColor));
    });

    test('CartItem quantity can be zero', () {
      final item = CartItem(
        product: testProduct,
        quantity: 0,
        selectedSize: '',
        selectedColor: '',
      );

      expect(item.quantity, 0);
    });

    test('CartItem product reference is maintained', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: '',
        selectedColor: '',
      );

      expect(item.product.price, 19.99);
      expect(item.product.category, 'test');
    });

    test('Multiple CartItems can reference same product', () {
      final item1 = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Red',
      );

      final item2 = CartItem(
        product: testProduct,
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Blue',
      );

      expect(item1.product.id, item2.product.id);
      expect(item1.quantity, isNot(item2.quantity));
    });

    test('CartItem all fields are not null', () {
      final item = CartItem(
        product: testProduct,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Red',
      );

      expect(item.product, isNotNull);
      expect(item.quantity, isNotNull);
      expect(item.selectedSize, isNotNull);
      expect(item.selectedColor, isNotNull);
    });
  });
}
