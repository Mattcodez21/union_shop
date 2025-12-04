import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/order.dart';

void main() {
  group('Order Model Tests', () {
    test('Order can be created with all required fields', () {
      final order = Order(
        id: 'order-123',
        userId: 'user-456',
        items: [],
        totalPrice: 50.00,
        orderDate: DateTime(2024, 1, 1),
        status: 'pending',
        shippingAddress: '123 Main St',
        billingAddress: '123 Main St',
      );

      expect(order.id, equals('order-123'));
      expect(order.userId, equals('user-456'));
      expect(order.totalPrice, equals(50.00));
      expect(order.status, equals('pending'));
    });

    test('Order can be converted to map', () {
      final order = Order(
        id: 'order-123',
        userId: 'user-456',
        items: [],
        totalPrice: 50.00,
        orderDate: DateTime(2024, 1, 1),
        status: 'pending',
        shippingAddress: '123 Main St',
        billingAddress: '123 Main St',
      );

      final map = order.toMap();
      expect(map['id'], equals('order-123'));
      expect(map['userId'], equals('user-456'));
      expect(map['totalPrice'], equals(50.00));
      expect(map['status'], equals('pending'));
    });

    test('Order can be created from map', () {
      final map = {
        'id': 'order-123',
        'userId': 'user-456',
        'items': [],
        'totalPrice': 50.00,
        'orderDate': '2024-01-01T00:00:00.000',
        'status': 'pending',
        'shippingAddress': '123 Main St',
        'billingAddress': '123 Main St',
      };

      final order = Order.fromMap(map);
      expect(order.id, equals('order-123'));
      expect(order.userId, equals('user-456'));
      expect(order.totalPrice, equals(50.00));
    });

    test('Order with items can be converted to map and back', () {
      final orderItem = OrderItem(
        productId: 'prod-1',
        productName: 'Test Product',
        price: 25.00,
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Black',
        imageUrl: 'test.jpg',
      );

      final order = Order(
        id: 'order-123',
        userId: 'user-456',
        items: [orderItem],
        totalPrice: 50.00,
        orderDate: DateTime(2024, 1, 1),
        status: 'pending',
        shippingAddress: '123 Main St',
        billingAddress: '123 Main St',
      );

      final map = order.toMap();
      final restoredOrder = Order.fromMap(map);

      expect(restoredOrder.items.length, equals(1));
      expect(restoredOrder.items.first.productName, equals('Test Product'));
    });

    test('Order supports different statuses', () {
      final statuses = [
        'pending',
        'processing',
        'shipped',
        'delivered',
        'cancelled'
      ];

      for (var status in statuses) {
        final order = Order(
          id: 'order-$status',
          userId: 'user-456',
          items: [],
          totalPrice: 50.00,
          orderDate: DateTime.now(),
          status: status,
          shippingAddress: '123 Main St',
          billingAddress: '123 Main St',
        );

        expect(order.status, equals(status));
      }
    });
  });

  group('OrderItem Model Tests', () {
    test('OrderItem can be created with all required fields', () {
      final item = OrderItem(
        productId: 'prod-1',
        productName: 'Test Product',
        price: 25.00,
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Black',
        imageUrl: 'test.jpg',
      );

      expect(item.productId, equals('prod-1'));
      expect(item.productName, equals('Test Product'));
      expect(item.price, equals(25.00));
      expect(item.quantity, equals(2));
    });

    test('OrderItem can be converted to map', () {
      final item = OrderItem(
        productId: 'prod-1',
        productName: 'Test Product',
        price: 25.00,
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Black',
        imageUrl: 'test.jpg',
      );

      final map = item.toMap();
      expect(map['productId'], equals('prod-1'));
      expect(map['productName'], equals('Test Product'));
      expect(map['price'], equals(25.00));
      expect(map['quantity'], equals(2));
    });

    test('OrderItem can be created from map', () {
      final map = {
        'productId': 'prod-1',
        'productName': 'Test Product',
        'price': 25.00,
        'quantity': 2,
        'selectedSize': 'M',
        'selectedColor': 'Black',
        'imageUrl': 'test.jpg',
      };

      final item = OrderItem.fromMap(map);
      expect(item.productId, equals('prod-1'));
      expect(item.productName, equals('Test Product'));
      expect(item.price, equals(25.00));
    });

    test('OrderItem supports empty size and color', () {
      final item = OrderItem(
        productId: 'prod-1',
        productName: 'Digital Product',
        price: 10.00,
        quantity: 1,
        selectedSize: '',
        selectedColor: '',
        imageUrl: 'test.jpg',
      );

      expect(item.selectedSize, isEmpty);
      expect(item.selectedColor, isEmpty);
    });

    test('OrderItem can have quantity of 1', () {
      final item = OrderItem(
        productId: 'prod-1',
        productName: 'Test',
        price: 10.00,
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Red',
        imageUrl: 'test.jpg',
      );

      expect(item.quantity, equals(1));
    });

    test('OrderItem can have large quantity', () {
      final item = OrderItem(
        productId: 'prod-1',
        productName: 'Test',
        price: 10.00,
        quantity: 100,
        selectedSize: 'S',
        selectedColor: 'Red',
        imageUrl: 'test.jpg',
      );

      expect(item.quantity, equals(100));
    });
  });
}
