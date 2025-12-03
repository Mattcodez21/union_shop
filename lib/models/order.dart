class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double totalPrice;
  final DateTime orderDate;
  final String
      status; // 'pending', 'processing', 'shipped', 'delivered', 'cancelled'
  final String shippingAddress;
  final String billingAddress;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
    required this.status,
    required this.shippingAddress,
    required this.billingAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toMap()).toList(),
      'totalPrice': totalPrice,
      'orderDate': orderDate.toIso8601String(),
      'status': status,
      'shippingAddress': shippingAddress,
      'billingAddress': billingAddress,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      items: (map['items'] as List<dynamic>)
          .map((item) => OrderItem.fromMap(item as Map<String, dynamic>))
          .toList(),
      totalPrice: (map['totalPrice'] as num).toDouble(),
      orderDate: DateTime.parse(map['orderDate']),
      status: map['status'] ?? 'pending',
      shippingAddress: map['shippingAddress'] ?? '',
      billingAddress: map['billingAddress'] ?? '',
    );
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final double price;
  final int quantity;
  final String selectedSize;
  final String selectedColor;
  final String imageUrl;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.selectedSize,
    required this.selectedColor,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'price': price,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor,
      'imageUrl': imageUrl,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      price: (map['price'] as num).toDouble(),
      quantity: map['quantity'] ?? 1,
      selectedSize: map['selectedSize'] ?? '',
      selectedColor: map['selectedColor'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
