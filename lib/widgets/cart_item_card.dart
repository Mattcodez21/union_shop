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
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: item.product.imageUrls.isNotEmpty
            ? Image.asset(
                item.product.imageUrls.first,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              )
            : const Icon(Icons.shopping_bag, size: 40),
        title: Text(item.product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.selectedColor.isNotEmpty)
              Text('Color: ${item.selectedColor}'),
            if (item.selectedSize.isNotEmpty)
              Text('Size: ${item.selectedSize}'),
            Text('Price: £${item.product.price.toStringAsFixed(2)}'),
            Text(
              'Subtotal: £${subtotal.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4d2963),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
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
                Text('${item.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    cartService.updateQuantity(
                      item.product.id,
                      item.selectedSize,
                      item.selectedColor,
                      item.quantity + 1,
                    );
                  },
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                cartService.removeFromCart(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
