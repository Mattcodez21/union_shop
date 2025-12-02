import 'package:flutter/material.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/services/cart_service.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartService = CartService();

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
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('x${item.quantity}'),
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
