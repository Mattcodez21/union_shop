import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../widgets/cart_item_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartService = CartService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: AnimatedBuilder(
        animation: cartService,
        builder: (context, _) {
          final items = cartService.items;
          if (items.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ...items.map((item) => CartItemCard(item: item)),
              const SizedBox(height: 24),
              Text(
                'Total: £${cartService.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // TODO: Add your checkout logic here (e.g., payment, order creation)
                  // If checkout is successful:
                  cartService.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Checkout complete! Cart cleared.')),
                  );
                },
                child: const Text('Checkout'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  cartService.clearCart();
                },
                child: const Text('Clear Cart'),
              ),
            ],
          );
        },
      ),
    );
  }
}
