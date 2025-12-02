import '../models/cart_item.dart';
import 'package:flutter/foundation.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addToCart(CartItem item) {
    final index = _items.indexWhere((cartItem) =>
        cartItem.product.id == item.product.id &&
        cartItem.selectedSize == item.selectedSize &&
        cartItem.selectedColor == item.selectedColor);
    if (index != -1) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  List<CartItem> getCartItems() {
    return List.unmodifiable(_items);
  }

  double getTotalPrice() {
    return _items.fold(
        0, (sum, item) => sum + item.product.price * item.quantity);
  }

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
}
