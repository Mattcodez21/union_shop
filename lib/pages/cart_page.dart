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
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    ...items.map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CartItemCard(item: item),
                        )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Total: £${cartService.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // TODO: Add your checkout logic here
                      cartService.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Checkout complete! Cart cleared.')),
                      );
                    },
                    child: const Text('Checkout'),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextButton(
                  onPressed: () {
                    cartService.clearCart();
                  },
                  child: const Text('Clear Cart'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
