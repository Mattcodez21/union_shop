import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(title: 'About Print Shack'),
      endDrawer: MobileNavDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, size: 64, color: Color(0xFF4d2963)),
                SizedBox(height: 24),
                Text(
                  'About The Print Shack',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4d2963),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'The Print Shack offers custom printing services for societies, clubs, and events. '
                  'Choose your text, font, and color, and we\'ll handle the rest! More features coming soon.',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Text(
                  'Service Information',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4d2963),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '• Fast turnaround for most orders (typically 3-5 working days)\n'
                  '• High-quality printing on a variety of garments and items\n'
                  '• Bulk discounts available for large orders\n'
                  '• Friendly support for design and ordering questions',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 28),
                Text(
                  'Guidelines',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4d2963),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '• Please ensure your custom text is appropriate and free from copyright infringement\n'
                  '• Maximum of 20 characters per print area\n'
                  '• For logos or images, please contact us directly\n'
                  '• Payment is required before printing begins\n'
                  '• Collect your order from the Union Shop when ready',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
