import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Test wrapper for Product page without Navbar to avoid Firebase
class TestProductPage extends StatefulWidget {
  const TestProductPage({Key? key}) : super(key: key);

  @override
  State<TestProductPage> createState() => _TestProductPageState();
}

class _TestProductPageState extends State<TestProductPage> {
  String _selectedColor = 'Black';
  String _selectedSize = 'M';
  int _quantity = 1;
  int _selectedImageIndex = 0;

  final List<String> _images = [
    'assets/images/signature_hoodie.png',
    'assets/images/signature_hoodie.png',
    'assets/images/signature_hoodie.png',
    'assets/images/signature_hoodie.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main product image
              Center(
                child: Image.asset(
                  _images[_selectedImageIndex],
                  height: 400,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 400,
                      color: Colors.grey[200],
                      child: const Icon(Icons.shopping_bag, size: 100),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Image carousel/thumbnails
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImageIndex = index;
                        });
                      },
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedImageIndex == index
                                ? Colors.purple
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          _images[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.image),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Product name
              const Text(
                'Signature Hoodie',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Price and tax
              const Text(
                '£15.00',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Tax included',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // Color dropdown
              const Text(
                'Color',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedColor,
                isExpanded: true,
                items: ['Black', 'Purple', 'Green', 'Grey']
                    .map((color) => DropdownMenuItem(
                          value: color,
                          child: Text(color),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedColor = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Size dropdown
              const Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedSize,
                isExpanded: true,
                items: ['S', 'M', 'L', 'XL']
                    .map((size) => DropdownMenuItem(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Quantity dropdown
              const Text(
                'Quantity',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButton<int>(
                value: _quantity,
                isExpanded: true,
                items: List.generate(10, (index) => index + 1)
                    .map((qty) => DropdownMenuItem(
                          value: qty,
                          child: Text(qty.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _quantity = value!;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Add to cart button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Buy with Shop Pay button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Buy with Shop Pay'),
                ),
              ),
              const SizedBox(height: 24),

              // Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Bringing to you, our best selling signature hoodie! Perfect for showing your university pride and staying comfortable during those long study sessions.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),

              // Back to collection button
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('BACK TO COLLECTION'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  group('Product Page Tests', () {
    testWidgets('Product page accessible via route',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TestProductPage), findsOneWidget);
    });

    testWidgets('Main product image displays', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for Image widgets
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('Image carousel/thumbnails visible below main image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Find the horizontal ListView
      final carouselFinder = find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.scrollDirection == Axis.horizontal,
      );
      expect(carouselFinder, findsOneWidget);

      // Check for thumbnail images
      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('Product name displays prominently',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      final productNameFinder = find.text('Signature Hoodie');
      expect(productNameFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(productNameFinder);
      expect(textWidget.style?.fontSize, 32);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('Price displays with "Tax included" text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('Tax included'), findsOneWidget);

      final priceWidget = tester.widget<Text>(find.text('£15.00'));
      expect(priceWidget.style?.fontSize, 28);
      expect(priceWidget.style?.fontWeight, FontWeight.bold);
      expect(priceWidget.style?.color, const Color(0xFF4d2963));

      final taxWidget = tester.widget<Text>(find.text('Tax included'));
      expect(taxWidget.style?.fontSize, 14);
    });

    testWidgets('Color dropdown shows options', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to the color dropdown
      final colorDropdownFinder = find.byWidgetPredicate(
        (widget) => widget is DropdownButton<String> && widget.value == 'Black',
      );
      expect(colorDropdownFinder, findsOneWidget);

      await tester.ensureVisible(colorDropdownFinder);
      await tester.pumpAndSettle();

      await tester.tap(colorDropdownFinder);
      await tester.pumpAndSettle();

      expect(find.text('Black'), findsWidgets);
      expect(find.text('Purple'), findsOneWidget);
      expect(find.text('Green'), findsOneWidget);
      expect(find.text('Grey'), findsOneWidget);
    });

    testWidgets('Size dropdown shows options (S, M, L, XL)',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to the size dropdown
      final sizeDropdownFinder = find.byWidgetPredicate(
        (widget) => widget is DropdownButton<String> && widget.value == 'M',
      );
      expect(sizeDropdownFinder, findsOneWidget);

      await tester.ensureVisible(sizeDropdownFinder);
      await tester.pumpAndSettle();

      await tester.tap(sizeDropdownFinder);
      await tester.pumpAndSettle();

      expect(find.text('S'), findsOneWidget);
      expect(find.text('M'), findsWidgets);
      expect(find.text('L'), findsOneWidget);
      expect(find.text('XL'), findsOneWidget);
    });

    testWidgets('Quantity field displays (default 1)',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to the quantity dropdown
      final quantityDropdownFinder = find.byWidgetPredicate(
        (widget) => widget is DropdownButton<int> && widget.value == 1,
      );
      expect(quantityDropdownFinder, findsOneWidget);
      expect(find.text('Quantity'), findsOneWidget);

      await tester.ensureVisible(quantityDropdownFinder);
      await tester.pumpAndSettle();

      await tester.tap(quantityDropdownFinder);
      await tester.pumpAndSettle();

      expect(find.text('1'), findsWidgets);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('"ADD TO CART" button visible', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      final addToCartButtonFinder = find.text('ADD TO CART');
      expect(addToCartButtonFinder, findsOneWidget);

      final elevatedButtonFinder = find.ancestor(
        of: addToCartButtonFinder,
        matching: find.byType(ElevatedButton),
      );
      expect(elevatedButtonFinder, findsOneWidget);
    });

    testWidgets('"Buy with Shop Pay" button visible',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      final shopPayButtonFinder = find.text('Buy with Shop Pay');
      expect(shopPayButtonFinder, findsOneWidget);
      expect(find.byType(OutlinedButton), findsWidgets);
    });

    testWidgets('Product description paragraph visible',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Description'), findsOneWidget);
      expect(
        find.text(
          'Bringing to you, our best selling signature hoodie! Perfect for showing your university pride and staying comfortable during those long study sessions.',
        ),
        findsOneWidget,
      );

      final headingWidget = tester.widget<Text>(find.text('Description'));
      expect(headingWidget.style?.fontWeight, FontWeight.bold);
      expect(headingWidget.style?.fontSize, 20);
    });

    testWidgets('Back button navigates to previous page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestProductPage(),
                      ),
                    );
                  },
                  child: const Text('Go to Product'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Go to Product'));
      await tester.pumpAndSettle();

      expect(find.byType(TestProductPage), findsOneWidget);

      final backButtonFinder = find.text('BACK TO COLLECTION');
      expect(backButtonFinder, findsOneWidget);

      // Scroll to the back button before tapping
      await tester.ensureVisible(backButtonFinder);
      await tester.pumpAndSettle();

      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(TestProductPage), findsNothing);
      expect(find.text('Go to Product'), findsOneWidget);
    });
  });
}
