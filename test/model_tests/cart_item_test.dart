import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/data/products_data.dart';

void main() {
  group('CartItem Model Tests', () {
    test('CartItem can be created with all required fields', () {
      final product = products.first;
      final cartItem = CartItem(
        product: product,
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Black',
      );

      expect(cartItem.product.id, equals(product.id));
      expect(cartItem.quantity, equals(2));
      expect(cartItem.selectedSize, equals('M'));
      expect(cartItem.selectedColor, equals('Black'));
    });

    test('CartItem fields are accessible', () {
      final product = products.first;
      final cartItem = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'L',
        selectedColor: 'White',
      );

      expect(cartItem.product, isA<Product>());
      expect(cartItem.quantity, isA<int>());
      expect(cartItem.selectedSize, isA<String>());
      expect(cartItem.selectedColor, isA<String>());
    });

    test('CartItem can have quantity of 1', () {
      final product = products.first;
      final cartItem = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Red',
      );

      expect(cartItem.quantity, equals(1));
    });

    test('CartItem can have large quantity', () {
      final product = products.first;
      final cartItem = CartItem(
        product: product,
        quantity: 99,
        selectedSize: 'XL',
        selectedColor: 'Blue',
      );

      expect(cartItem.quantity, equals(99));
    });

    test('CartItem retains product information', () {
      final product = products[0];
      final cartItem = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Black',
      );

      expect(cartItem.product.name, equals(product.name));
      expect(cartItem.product.price, equals(product.price));
    });

    test('CartItem size and color are stored correctly', () {
      final product = products.first;
      final cartItem = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'XL',
        selectedColor: 'Navy',
      );

      expect(cartItem.selectedSize, equals('XL'));
      expect(cartItem.selectedColor, equals('Navy'));
    });

    test('Multiple CartItems can be created from same product', () {
      final product = products.first;
      final cartItem1 = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'M',
        selectedColor: 'Black',
      );
      final cartItem2 = CartItem(
        product: product,
        quantity: 2,
        selectedSize: 'L',
        selectedColor: 'White',
      );

      expect(cartItem1.product.id, equals(cartItem2.product.id));
      expect(cartItem1.quantity, isNot(equals(cartItem2.quantity)));
      expect(cartItem1.selectedSize, isNot(equals(cartItem2.selectedSize)));
    });
  });
}
