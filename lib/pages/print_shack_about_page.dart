import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/navbar.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: 'About Print Shack',
        cartService: CartService(),
      ),
      endDrawer: const MobileNavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBanner(),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const Icon(Icons.info_outline,
                      size: 64, color: Color(0xFF4d2963)),
                  const SizedBox(height: 24),
                  const Text(
                    'About The Print Shack',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Print Shack offers custom printing services for societies, clubs, and events. '
                    'Choose your text, font, and color, and we\'ll handle the rest! More features coming soon.',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Service Information',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '• Fast turnaround for most orders (typically 3-5 working days)\n'
                    '• High-quality printing on a variety of garments and items\n'
                    '• Bulk discounts available for large orders\n'
                    '• Friendly support for design and ordering questions',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Guidelines',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '• Please ensure your custom text is appropriate and free from copyright infringement\n'
                    '• Maximum of 20 characters per print area\n'
                    '• For logos or images, please contact us directly\n'
                    '• Payment is required before printing begins\n'
                    '• Collect your order from the Union Shop when ready',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to Print Shack'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
