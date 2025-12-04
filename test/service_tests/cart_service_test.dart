import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';
import '../test_helpers/firebase_test_helper.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  late CartService service;

  setUp(() {
    service = CartService();
    service.clearCart();
  });

  test('singleton returns same instance', () {
    final a = CartService();
    final b = CartService();
    expect(identical(a, b), isTrue);
  });

  test('starts empty', () {
    expect(service.items, isEmpty);
    expect(service.itemCount, equals(0));
    expect(service.totalPrice, equals(0));
  });

  test('addToCart adds new item and notifies', () {
    var notified = false;
    void listener() => notified = true;
    service.addListener(listener);

    final product = Product(
      id: 'p1',
      name: 'Test',
      description: 'desc',
      price: 10.0,
      category: 'cat',
      sizes: <String>[],
      colors: <String>[],
      imageUrls: <String>[],
    );

    final item = CartItem(
      product: product,
      quantity: 1,
      selectedSize: 'M',
      selectedColor: 'Red',
    );

    service.addToCart(item);

    expect(service.items.length, equals(1));
    expect(service.itemCount, equals(1));
    expect(service.totalPrice, equals(10.0));
    expect(notified, isTrue);

    service.removeListener(listener);
  });

  test('addToCart merges same variant quantities', () {
    final product = Product(
      id: 'p2',
      name: 'T2',
      description: '',
      price: 5.0,
      category: '',
      sizes: <String>[],
      colors: <String>[],
      imageUrls: <String>[],
    );

    final a = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Blue');
    final b = CartItem(
        product: product,
        quantity: 2,
        selectedSize: 'S',
        selectedColor: 'Blue');

    service.addToCart(a);
    service.addToCart(b);

    expect(service.items.length, equals(1));
    expect(service.itemCount, equals(3));
    expect(service.totalPrice, equals(15.0));
  });

  test('updateQuantity updates and removes when zero', () {
    final product = Product(
      id: 'p3',
      name: 'T3',
      description: '',
      price: 2.0,
      category: '',
      sizes: <String>[],
      colors: <String>[],
      imageUrls: <String>[],
    );

    final item = CartItem(
        product: product,
        quantity: 1,
        selectedSize: 'L',
        selectedColor: 'Black');
    service.addToCart(item);

    expect(service.itemCount, equals(1));

    service.updateQuantity(product.id, 'L', 'Black', 4);
    expect(service.itemCount, equals(4));

    service.updateQuantity(product.id, 'L', 'Black', 0);
    expect(service.items, isEmpty);
    expect(service.itemCount, equals(0));
  });

  test('removeFromCart removes the correct variant', () {
    final product = Product(
      id: 'p4',
      name: 'T4',
      description: '',
      price: 3.0,
      category: '',
      sizes: <String>[],
      colors: <String>[],
      imageUrls: <String>[],
    );

    final one = CartItem(
        product: product, quantity: 1, selectedSize: 'M', selectedColor: 'Red');
    final two = CartItem(
        product: product, quantity: 1, selectedSize: 'L', selectedColor: 'Red');

    service.addToCart(one);
    service.addToCart(two);

    expect(service.items.length, equals(2));

    service.removeFromCart(one);

    expect(service.items.length, equals(1));
    expect(service.items.first.selectedSize, equals('L'));
  });

  test('clearCart empties cart', () {
    final product = Product(
      id: 'p5',
      name: 'T5',
      description: '',
      price: 4.0,
      category: '',
      sizes: <String>[],
      colors: <String>[],
      imageUrls: <String>[],
    );

    service.addToCart(CartItem(
        product: product, quantity: 1, selectedSize: '', selectedColor: ''));
    service.addToCart(CartItem(
        product: product, quantity: 2, selectedSize: 'XL', selectedColor: ''));

    expect(service.items.isNotEmpty, isTrue);

    service.clearCart();

    expect(service.items, isEmpty);
    expect(service.itemCount, equals(0));
    expect(service.totalPrice, equals(0));
  });

  test('loadCart/saveCart are safe with no authenticated user', () async {
    await service.loadCart();
    await service.saveCart();
    expect(service.items, isA<List<CartItem>>());
  });
}
