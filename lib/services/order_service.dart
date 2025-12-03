import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/order.dart' as order_model;
import '../models/cart_item.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create an order from cart items
  Future<String?> createOrder({
    required List<CartItem> cartItems,
    required double totalPrice,
    required String shippingAddress,
    required String billingAddress,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      final orderId = _firestore.collection('orders').doc().id;

      final orderItems = cartItems
          .map((cartItem) => order_model.OrderItem(
                productId: cartItem.product.id,
                productName: cartItem.product.name,
                price: cartItem.product.price,
                quantity: cartItem.quantity,
                selectedSize: cartItem.selectedSize,
                selectedColor: cartItem.selectedColor,
                imageUrl: cartItem.product.imageUrls.isNotEmpty
                    ? cartItem.product.imageUrls.first
                    : '',
              ))
          .toList();

      final order = order_model.Order(
        id: orderId,
        userId: user.uid,
        items: orderItems,
        totalPrice: totalPrice,
        orderDate: DateTime.now(),
        status: 'pending',
        shippingAddress: shippingAddress,
        billingAddress: billingAddress,
      );

      await _firestore.collection('orders').doc(orderId).set(order.toMap());
      return orderId;
    } catch (e) {
      // ignore: avoid_print
      print('Error creating order: $e');
      return null;
    }
  }

  // Get all orders for current user
  Future<List<order_model.Order>> getUserOrders() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return [];

      final querySnapshot = await _firestore
          .collection('orders')
          .where('userId', isEqualTo: user.uid)
          .orderBy('orderDate', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => order_model.Order.fromMap(doc.data()))
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching orders: $e');
      return [];
    }
  }

  // Get a specific order by ID
  Future<order_model.Order?> getOrderById(String orderId) async {
    try {
      final doc = await _firestore.collection('orders').doc(orderId).get();
      if (doc.exists) {
        return order_model.Order.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching order: $e');
      return null;
    }
  }

  // Update order status
  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _firestore.collection('orders').doc(orderId).update({
        'status': status,
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error updating order status: $e');
    }
  }
}
