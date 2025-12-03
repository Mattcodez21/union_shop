import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../data/products_data.dart' as products_data;

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);

  double get totalPrice => _items.fold(
      0, (total, item) => total + item.product.price * item.quantity);

  // Save cart to Firestore
  Future<void> saveCart() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final cartData = _items
        .map((item) => {
              'productId': item.product.id,
              'quantity': item.quantity,
              'selectedSize': item.selectedSize,
              'selectedColor': item.selectedColor,
              // Save full product data for custom items (like print shack)
              'productData': {
                'id': item.product.id,
                'name': item.product.name,
                'description': item.product.description,
                'price': item.product.price,
                'category': item.product.category,
                'sizes': item.product.sizes,
                'colors': item.product.colors,
                'imageUrls': item.product.imageUrls,
              },
            })
        .toList();
    await FirebaseFirestore.instance
        .collection('carts')
        .doc(user.uid)
        .set({'items': cartData});
  }

  // Load cart from Firestore
  Future<void> loadCart() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final doc = await FirebaseFirestore.instance
        .collection('carts')
        .doc(user.uid)
        .get();
    if (doc.exists) {
      final data = doc.data();
      if (data != null && data['items'] is List) {
        _items.clear();
        for (var item in data['items']) {
          Product? product;

          // Try to get product from products_data first
          product = products_data.getProductById(item['productId']);

          // If not found (e.g., custom print shack item), create from saved data
          if (product == null && item['productData'] != null) {
            final productData = item['productData'];
            product = Product(
              id: productData['id'],
              name: productData['name'],
              description: productData['description'],
              price: (productData['price'] as num).toDouble(),
              category: productData['category'],
              sizes: List<String>.from(productData['sizes'] ?? []),
              colors: List<String>.from(productData['colors'] ?? []),
              imageUrls: List<String>.from(productData['imageUrls'] ?? []),
            );
          }

          if (product != null) {
            _items.add(CartItem(
              product: product,
              quantity: item['quantity'] ?? 1,
              selectedSize: item['selectedSize'] ?? '',
              selectedColor: item['selectedColor'] ?? '',
            ));
          }
        }
        notifyListeners();
      }
    }
  }

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
    saveCart();
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
      saveCart();
    }
  }

  void removeFromCart(CartItem item) {
    _items.removeWhere((cartItem) =>
        cartItem.product.id == item.product.id &&
        cartItem.selectedSize == item.selectedSize &&
        cartItem.selectedColor == item.selectedColor);
    notifyListeners();
    saveCart();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
    saveCart();
  }
}

// Helper function to get product by ID
Product? getProductById(String id) {
  try {
    return products_data.getProductById(id);
  } catch (e) {
    return null;
  }
}
