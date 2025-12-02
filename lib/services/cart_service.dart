import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

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

  void updateQuantity(String productId, String selectedSize,
      String selectedColor, int quantity) {
    final index = _items.indexWhere((cartItem) =>
        cartItem.product.id == productId &&
        cartItem.selectedSize == selectedSize &&
        cartItem.selectedColor == selectedColor);
    if (index != -1) {
      _items[index].quantity = quantity;
      if (_items[index].quantity <= 0) {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeFromCart(CartItem item) {
    _items.removeWhere((cartItem) =>
        cartItem.product.id == item.product.id &&
        cartItem.selectedSize == item.selectedSize &&
        cartItem.selectedColor == item.selectedColor);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
