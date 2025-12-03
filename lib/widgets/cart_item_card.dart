import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../services/cart_service.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartService = CartService();
    final subtotal = item.product.price * item.quantity;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            item.product.imageUrls.isNotEmpty
                ? Image.asset(
                    item.product.imageUrls.first,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.shopping_bag, size: 80),
            const SizedBox(width: 12),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (item.selectedColor.isNotEmpty)
                    Text('Color: ${item.selectedColor}',
                        style: const TextStyle(fontSize: 14)),
                  if (item.selectedSize.isNotEmpty)
                    Text('Size: ${item.selectedSize}',
                        style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text('Price: £${item.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14)),
                  Text(
                    'Subtotal: £${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Quantity controls
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          if (item.quantity > 1) {
                            cartService.updateQuantity(
                              item.product.id,
                              item.selectedSize,
                              item.selectedColor,
                              item.quantity - 1,
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('${item.quantity}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          cartService.updateQuantity(
                            item.product.id,
                            item.selectedSize,
                            item.selectedColor,
                            item.quantity + 1,
                          );
                        },
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          cartService.removeFromCart(item);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
