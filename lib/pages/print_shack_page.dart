import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/cart_item.dart';

class PrintShackPage extends StatefulWidget {
  const PrintShackPage({Key? key}) : super(key: key);

  @override
  State<PrintShackPage> createState() => _PrintShackPageState();
}

class _PrintShackPageState extends State<PrintShackPage> {
  String customText = '';
  String perLine = 'One Line of Text';
  int quantity = 1;
  final cartService = CartService();

  final List<String> perLineOptions = [
    'One Line of Text',
    'Two Lines of Text',
  ];

  void _addToCart() {
    if (customText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter personalisation text')),
      );
      return;
    }

    // Create a product for the personalisation
    final price = perLine == 'One Line of Text' ? 3.00 : 5.00;
    final product = Product(
      id: 'print_shack_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Personalisation - $perLine',
      description: 'Custom text: $customText',
      price: price,
      category: 'Print Shack',
      sizes: [],
      colors: [],
      imageUrls: ['assets/images/print_shack_hoodie.png'],
    );

    final cartItem = CartItem(
      product: product,
      quantity: quantity,
      selectedSize: '',
      selectedColor: '',
    );

    cartService.addToCart(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $quantity x ${product.name} to cart!'),
        backgroundColor: const Color(0xFF4d2963),
      ),
    );

    // Clear form
    setState(() {
      customText = '';
      perLine = 'One Line of Text';
      quantity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: 'The Print Shack'),
      endDrawer: const MobileNavDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Images (left)
                    Column(
                      children: [
                        // Main image
                        Container(
                          width: 260,
                          height: 260,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/print_shack_hoodie.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Thumbnails
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.asset(
                                'assets/images/print_shack_hoodie.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.asset(
                                'assets/images/print_shack_hoodie2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 48),
                    // Form (right)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Personalisation',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '£${perLine == 'One Line of Text' ? '3.00' : '5.00'}',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Tax included.',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Per Line:',
                            style: TextStyle(fontSize: 16),
                          ),
                          DropdownButton<String>(
                            value: perLine,
                            items: perLineOptions
                                .map((option) => DropdownMenuItem(
                                      value: option,
                                      child: Text(option),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                perLine = value!;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Personalisation Line 1:',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextField(
                            maxLength: 10,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              counterText: '',
                            ),
                            onChanged: (value) {
                              setState(() {
                                customText = value;
                              });
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${customText.length}/10',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Quantity',
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                      text: quantity.toString()),
                                  onChanged: (value) {
                                    setState(() {
                                      quantity = int.tryParse(value) ?? 1;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: _addToCart,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4d2963),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 18),
                                ),
                                child: const Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '£3 for one line of text! £5 for two!\n\n'
                            'One line of text is 10 characters.\n\n'
                            'Please ensure all spellings are correct before submitting your purchase as we will print your item with the exact wording you provide. We will not be responsible for any incorrect spellings printed onto your garment. Personalised items do not qualify for refunds.',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
