import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/services/order_service.dart';
import 'package:union_shop/models/order.dart';
import 'package:union_shop/widgets/cart_item_card.dart';

class AccountManager extends StatefulWidget {
  const AccountManager({Key? key}) : super(key: key);

  @override
  State<AccountManager> createState() => _AccountManagerState();
}

class _AccountManagerState extends State<AccountManager> {
  final _displayNameController = TextEditingController();
  String? _statusMessage;
  bool _isUpdating = false;
  List<Order> _orders = [];
  bool _isLoadingOrders = true;
  final OrderService _orderService = OrderService();

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    _displayNameController.text = user?.displayName ?? '';
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    setState(() {
      _isLoadingOrders = true;
    });
    final orders = await _orderService.getUserOrders();
    setState(() {
      _orders = orders;
      _isLoadingOrders = false;
    });
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isUpdating = true;
      _statusMessage = null;
    });
    try {
      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(_displayNameController.text.trim());
      await FirebaseAuth.instance.currentUser?.reload();
      setState(() {
        _statusMessage = "Profile updated!";
      });
    } catch (e) {
      setState(() {
        _statusMessage = "Failed to update profile.";
      });
    } finally {
      setState(() {
        _isUpdating = false;
      });
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'shipped':
        return Colors.purple;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final day = date.day.toString().padLeft(2, '0');
    final month = months[date.month - 1];
    final year = date.year;
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$month $day, $year - $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final cartService = CartService();

    if (user == null) {
      Future.microtask(() {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/auth');
        }
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: const Navbar(title: "Account Manager"),
      endDrawer: const MobileNavDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Management",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Text("Email:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Text(user.email ?? "No email",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          )),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      labelText: "Display Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_statusMessage != null)
                    Text(
                      _statusMessage!,
                      style: TextStyle(
                        color: _statusMessage == "Profile updated!"
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isUpdating ? null : _updateProfile,
                    child: _isUpdating
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Update Profile"),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _signOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Sign Out"),
                  ),
                  const SizedBox(height: 40),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  AnimatedBuilder(
                    animation: cartService,
                    builder: (context, _) {
                      final items = cartService.items;
                      if (items.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text('Your cart is empty'),
                        );
                      }
                      return Column(
                        children: [
                          ...items.map((item) => CartItemCard(item: item)),
                          const SizedBox(height: 12),
                          Text(
                            'Total: £${cartService.totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Order History",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: _loadOrders,
                        tooltip: 'Refresh orders',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _isLoadingOrders
                      ? const Center(child: CircularProgressIndicator())
                      : _orders.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Text('No orders yet'),
                            )
                          : Column(
                              children: _orders.map((order) {
                                return Card(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  elevation: 2,
                                  child: ExpansionTile(
                                    title: Text(
                                      'Order #${order.id.substring(0, 8)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _formatDate(order.orderDate),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: _getStatusColor(
                                                    order.status),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                order.status.toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              '£${order.totalPrice.toStringAsFixed(2)}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Items:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 8),
                                            ...order.items.map((item) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    if (item
                                                        .imageUrl.isNotEmpty)
                                                      Image.asset(
                                                        item.imageUrl,
                                                        width: 50,
                                                        height: 50,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return Container(
                                                            width: 50,
                                                            height: 50,
                                                            color: Colors
                                                                .grey[200],
                                                            child: const Icon(Icons
                                                                .shopping_bag),
                                                          );
                                                        },
                                                      ),
                                                    const SizedBox(width: 12),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            item.productName,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          if (item.selectedSize
                                                              .isNotEmpty)
                                                            Text(
                                                              'Size: ${item.selectedSize}',
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          if (item.selectedColor
                                                              .isNotEmpty)
                                                            Text(
                                                              'Color: ${item.selectedColor}',
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          Text(
                                                            'Qty: ${item.quantity}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      '£${(item.price * item.quantity).toStringAsFixed(2)}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                            const Divider(),
                                            if (order.shippingAddress
                                                .isNotEmpty) ...[
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Shipping Address:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(order.shippingAddress),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
