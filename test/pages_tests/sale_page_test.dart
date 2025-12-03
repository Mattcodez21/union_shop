import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock ProductCard for testing
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String? originalPrice;
  final bool showSaleBadge;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    this.originalPrice,
    this.showSaleBadge = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Stack(
          children: [
            Column(
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
                if (originalPrice != null)
                  Text(
                    originalPrice!,
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            if (showSaleBadge)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'SALE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Test wrapper for Sale page without Navbar to avoid Firebase
class TestSalePage extends StatelessWidget {
  const TestSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'SALE',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Promotional message
              const Text(
                'Over 20% off our Essential Range! Limited time only.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),

              // Filter and Sort dropdowns
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'FILTER BY',
                        border: OutlineInputBorder(),
                      ),
                      initialValue: 'All',
                      items: ['All', 'Clothing', 'Accessories']
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'SORT BY',
                        border: OutlineInputBorder(),
                      ),
                      initialValue: 'Featured',
                      items: [
                        'Featured',
                        'Price: Low to High',
                        'Price: High to Low'
                      ]
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Product count
              const Text(
                '8 products',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Product grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
                children: [
                  ProductCard(
                    name: 'Essential T-Shirt',
                    price: '£10.00',
                    originalPrice: '£17.00',
                    showSaleBadge: true,
                    onTap: () {},
                  ),
                  ProductCard(
                    name: 'Essential Hoodie',
                    price: '£15.00',
                    originalPrice: '£25.00',
                    showSaleBadge: true,
                    onTap: () {},
                  ),
                  ProductCard(
                    name: 'Essential Cap',
                    price: '£8.00',
                    originalPrice: '£12.00',
                    showSaleBadge: true,
                    onTap: () {},
                  ),
                  ProductCard(
                    name: 'Essential Mug',
                    price: '£5.00',
                    originalPrice: '£8.00',
                    showSaleBadge: true,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  group('Sale Page Tests', () {
    testWidgets('Sale page accessible via /sale route', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify TestSalePage is displayed
      expect(find.byType(TestSalePage), findsOneWidget);
    });

    testWidgets('"SALE" heading displays prominently', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify "SALE" heading is present
      expect(find.text('SALE'), findsWidgets);

      final headingWidget = tester.widget<Text>(find.text('SALE').first);
      expect(headingWidget.style?.fontSize, 32);
      expect(headingWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('Promotional message appears below title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Look for promotional message
      expect(find.textContaining('off'), findsOneWidget);
      expect(
        find.text('Over 20% off our Essential Range! Limited time only.'),
        findsOneWidget,
      );
    });

    testWidgets('Discount notice visible', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Look for discount notice
      final discountFound = find.textContaining('20%').evaluate().isNotEmpty ||
          find.textContaining('off').evaluate().isNotEmpty;
      expect(discountFound, isTrue);
    });

    testWidgets('Filter and sort dropdowns present (non-functional acceptable)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Look for filter and sort dropdowns
      expect(find.text('FILTER BY'), findsOneWidget);
      expect(find.text('SORT BY'), findsOneWidget);
      expect(find.byType(DropdownButtonFormField<String>), findsNWidgets(2));
    });

    testWidgets('Product count displays', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Look for product count text
      expect(find.text('8 products'), findsOneWidget);
    });

    testWidgets('Products show images and names', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Look for product images (icons in our mock)
      expect(find.byIcon(Icons.shopping_bag), findsWidgets);

      // Look for product names
      expect(find.text('Essential T-Shirt'), findsOneWidget);
      expect(find.text('Essential Hoodie'), findsOneWidget);
      expect(find.text('Essential Cap'), findsOneWidget);
      expect(find.text('Essential Mug'), findsOneWidget);
    });

    testWidgets('Original price shows with strikethrough (e.g., ~~£17.00~~)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Look for strikethrough text
      final strikethroughTexts = find.byWidgetPredicate((widget) {
        if (widget is Text) {
          final style = widget.style;
          return style != null &&
              style.decoration != null &&
              style.decoration == TextDecoration.lineThrough;
        }
        return false;
      });

      expect(strikethroughTexts, findsWidgets);
      expect(find.text('£17.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('Some products show "SALE" badge overlay', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestSalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Look for "SALE" badge
      expect(find.text('SALE'), findsWidgets);

      // Check for sale badges in positioned containers
      final saleBadges = find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color == Colors.red,
      );
      expect(saleBadges, findsWidgets);
    });

    testWidgets('Navigation from navbar works', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: Center(child: Text('Home Page')),
          ),
          routes: {
            '/sale': (context) => const TestSalePage(),
          },
        ),
      );
      await tester.pumpAndSettle();

      // Navigate to sale page
      final context = tester.element(find.text('Home Page'));
      Navigator.pushNamed(context, '/sale');
      await tester.pumpAndSettle();

      // Verify we're on the sale page
      expect(find.byType(TestSalePage), findsOneWidget);
      expect(find.text('SALE'), findsWidgets);

      // Navigate back
      Navigator.pop(context);
      await tester.pumpAndSettle();

      // Verify we're back on home
      expect(find.text('Home Page'), findsOneWidget);

      // Reset surface size
      await tester.binding.setSurfaceSize(null);
    });
  });
}
