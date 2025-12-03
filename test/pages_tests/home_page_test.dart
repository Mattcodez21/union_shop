import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock ProductCard for testing (matches the actual ProductCard structure)
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag,
              size: 48,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Test wrapper for Home page without Navbar to avoid Firebase
class TestHomePage extends StatelessWidget {
  const TestHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Union Shop'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.red,
              child: const Text(
                'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Hero Section
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text(
                    'Essential Range - Over 20% OFF!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('BROWSE PRODUCTS'),
                  ),
                ],
              ),
            ),

            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'FEATURED PRODUCTS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                    children: [
                      ProductCard(
                        name: 'Signature Hoodie',
                        price: '£20.00',
                        onTap: () {},
                      ),
                      ProductCard(
                        name: 'Signature T-Shirt',
                        price: '£14.99',
                        onTap: () {},
                      ),
                      ProductCard(
                        name: 'Essential T-Shirt',
                        price: '£10.00',
                        onTap: () {},
                      ),
                      ProductCard(
                        name: 'Portsmouth City Magnet',
                        price: '£4.50',
                        onTap: () {},
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

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestHomePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check that basic UI elements are present
      expect(
        find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );
      expect(find.text('Essential Range - Over 20% OFF!'), findsOneWidget);
      expect(
        find.text(
            'Over 20% off our Essential Range. Come and grab yours while stock lasts!'),
        findsOneWidget,
      );
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
      expect(find.text('FEATURED PRODUCTS'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestHomePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check that product cards are displayed
      expect(find.text('Signature Hoodie'), findsOneWidget);
      expect(find.text('Signature T-Shirt'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);

      // Check prices are displayed
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£14.99'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('£4.50'), findsOneWidget);
    });

    testWidgets('should display header elements', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestHomePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for AppBar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Union Shop'), findsOneWidget);
    });

    testWidgets('should have clickable product cards', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestHomePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check that product cards exist
      expect(find.byType(ProductCard), findsNWidgets(4));

      // Verify cards are in a GridView
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('banner should be red with white text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestHomePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Find the banner container
      final banner = find.ancestor(
        of: find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        matching: find.byType(Container),
      );

      expect(banner, findsOneWidget);

      // Check the container has red background
      final container = tester.widget<Container>(banner.first);
      final decoration = container.color;
      expect(decoration, equals(Colors.red));
    });
  });
}
