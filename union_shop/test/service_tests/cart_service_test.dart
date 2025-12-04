import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';
import '../test_helpers/firebase_mock_setup.dart';

void main() {
  setUpAll(() async {
    await initializeFirebaseMock();
  });

  test('CartService can be instantiated', () {
    final cartService = CartService();
    expect(cartService, isNotNull);
  });

  test('cart starts empty', () {
    final cartService = CartService();
    expect(cartService.itemCount, 0);
  });

  test('can add item to cart', () {
    final cartService = CartService();
    cartService.addToCart('item1');
    expect(cartService.itemCount, 1);
  });

  test('adding same item increases quantity', () {
    final cartService = CartService();
    cartService.addToCart('item1');
    cartService.addToCart('item1');
    expect(cartService.getItemQuantity('item1'), 2);
  });

  test('adding different size creates new cart item', () {
    final cartService = CartService();
    cartService.addToCart('item1', size: 'M');
    cartService.addToCart('item1', size: 'L');
    expect(cartService.itemCount, 2);
  });

  test('adding different color creates new cart item', () {
    final cartService = CartService();
    cartService.addToCart('item1', color: 'red');
    cartService.addToCart('item1', color: 'blue');
    expect(cartService.itemCount, 2);
  });

  test('can remove item from cart', () {
    final cartService = CartService();
    cartService.addToCart('item1');
    cartService.removeFromCart('item1');
    expect(cartService.itemCount, 0);
  });

  test('can update item quantity', () {
    final cartService = CartService();
    cartService.addToCart('item1');
    cartService.updateQuantity('item1', 3);
    expect(cartService.getItemQuantity('item1'), 3);
  });

  test('updating quantity to 0 removes item', () {
    final cartService = CartService();
    cartService.addToCart('item1');
    cartService.updateQuantity('item1', 0);
    expect(cartService.itemCount, 0);
  });

  test('total price is calculated correctly', () {
    final cartService = CartService();
    cartService.addToCart('item1', price: 10.0);
    cartService.addToCart('item2', price: 20.0);
    expect(cartService.totalPrice, 30.0);
  });

  test('total price updates with quantity', () {
    final cartService = CartService();
    cartService.addToCart('item1', price: 10.0);
    cartService.updateQuantity('item1', 2);
    expect(cartService.totalPrice, 20.0);
  });

  test('total price sums multiple items', () {
    final cartService = CartService();
    cartService.addToCart('item1', price: 10.0);
    cartService.addToCart('item2', price: 20.0);
    cartService.updateQuantity('item1', 2);
    expect(cartService.totalPrice, 40.0);
  });

  test('can clear entire cart', () {
    final cartService = CartService();
    cartService.addToCart('item1');
    cartService.clearCart();
    expect(cartService.itemCount, 0);
  });

  test('itemCount returns total quantity across all items', () {
    final cartService = CartService();
    cartService.addToCart('item1');
    cartService.addToCart('item1');
    cartService.addToCart('item2');
    expect(cartService.itemCount, 3);
  });

  test('products data is accessible', () {
    final cartService = CartService();
    expect(cartService.products, isNotEmpty);
  });

  test('can find product in products list', () {
    final cartService = CartService();
    expect(cartService.findProduct('item1'), isNotNull);
  });
}