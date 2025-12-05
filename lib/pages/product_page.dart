import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/data/products_data.dart' as products_data;

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Product? product;
  String? selectedSize;
  String? selectedColor;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    product = products_data.getProductById(widget.productId);
    // Set default selections, even if empty
    if (product != null) {
      selectedSize = product!.sizes.isNotEmpty ? product!.sizes.first : '';
      selectedColor = product!.colors.isNotEmpty ? product!.colors.first : '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        cartService: CartService(),
      ),
      endDrawer: const MobileNavDrawer(),
      body: product == null
          ? const Center(child: Text('Product not found'))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderBanner(),
                    // Product image
                    if (product!.imageUrls.isNotEmpty)
                      Center(
                        child: Image.asset(
                          product!.imageUrls.first,
                          height: 220,
                          fit: BoxFit.contain,
                        ),
                      ),
                    const SizedBox(height: 24),
                    Text(
                      product!.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '£${product!.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product!.description,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 24),
                    // Size dropdown (only if sizes exist)
                    if (product!.sizes.isNotEmpty)
                      Row(
                        children: [
                          const Text(
                            'Size:',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 16),
                          DropdownButton<String>(
                            value: selectedSize,
                            items: product!.sizes
                                .map((size) => DropdownMenuItem(
                                      value: size,
                                      child: Text(size),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSize = value;
                              });
                            },
                          ),
                        ],
                      ),
                    if (product!.sizes.isNotEmpty) const SizedBox(height: 16),
                    // Color dropdown (only if colors exist)
                    if (product!.colors.isNotEmpty)
                      Row(
                        children: [
                          const Text(
                            'Color:',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 16),
                          DropdownButton<String>(
                            value: selectedColor,
                            items: product!.colors
                                .map((color) => DropdownMenuItem(
                                      value: color,
                                      child: Text(color),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedColor = value;
                              });
                            },
                          ),
                        ],
                      ),
                    if (product!.colors.isNotEmpty) const SizedBox(height: 16),
                    // Quantity selector
                    Row(
                      children: [
                        const Text(
                          'Quantity:',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: quantity > 1
                              ? () {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              : null,
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Add to Cart button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (product != null) {
                            final cartItem = CartItem(
                              product: product!,
                              selectedSize: selectedSize ?? '',
                              selectedColor: selectedColor ?? '',
                              quantity: quantity,
                            );
                            CartService().addToCart(cartItem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Added $quantity item(s) to cart!'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'ADD TO CART',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
