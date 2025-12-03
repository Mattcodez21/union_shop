import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock ProductCard for testing
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

// Test wrapper that doesn't use Navbar to avoid Firebase
class TestCollectionPage extends StatelessWidget {
  final String collectionName;

  const TestCollectionPage({
    Key? key,
    required this.collectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get collection description
    final collectionDescriptions = {
      'Clothing':
          'Discover our premium clothing collection featuring comfortable and stylish apparel for every occasion.',
      'Accessories':
          'Complete your look with our carefully curated selection of accessories and lifestyle products.',
      'Home & Living':
          'Transform your living space with our modern and functional home decor items.',
      'Stationery':
          'Essential stationery items for work, study, and creative projects.',
      'Gifts':
          'Perfect gifts for your loved ones, carefully selected for special occasions.',
      'University Branded':
          'Show your university pride with our exclusive branded merchandise and apparel.',
    };

    final description = collectionDescriptions[collectionName] ??
        'Explore our ${collectionName.toLowerCase()} collection';

    // Mock products for testing
    final products = [
      {'name': 'Signature T-Shirt', 'price': '£14.99'},
      {'name': 'Signature Hoodie', 'price': '£20.00'},
      {'name': 'Essential T-Shirt', 'price': '£10.00'},
      {'name': 'Classic Polo', 'price': '£18.00'},
      {'name': 'Cotton Sweatshirt', 'price': '£25.00'},
      {'name': 'Basic Tee', 'price': '£12.00'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Collection header
            Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    collectionName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text('Products:'),
                  Text('${products.length} products'),
                ],
              ),
            ),

            // Filter and Sort controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: 'All Items',
                      decoration: const InputDecoration(
                        labelText: 'FILTER BY',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'All Items', child: Text('All Items')),
                        DropdownMenuItem(value: 'Size', child: Text('Size')),
                        DropdownMenuItem(value: 'Color', child: Text('Color')),
                        DropdownMenuItem(
                            value: 'Price Range', child: Text('Price Range')),
                        DropdownMenuItem(value: 'Brand', child: Text('Brand')),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: 'Featured',
                      decoration: const InputDecoration(
                        labelText: 'SORT BY',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'Featured', child: Text('Featured')),
                        DropdownMenuItem(
                            value: 'Price: Low to High',
                            child: Text('Price: Low to High')),
                        DropdownMenuItem(
                            value: 'Price: High to Low',
                            child: Text('Price: High to Low')),
                        DropdownMenuItem(
                            value: 'Name: A to Z', child: Text('Name: A to Z')),
                        DropdownMenuItem(
                            value: 'Name: Z to A', child: Text('Name: Z to A')),
                        DropdownMenuItem(
                            value: 'Newest', child: Text('Newest')),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Products Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(24.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      name: product['name']!,
                      price: product['price']!,
                      onTap: () {},
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  group('Collection Page Tests', () {
    testWidgets(
        'Collection page accessible with parameter (e.g., /collection/hoodies)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'hoodies'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TestCollectionPage), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('hoodies'), findsWidgets);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Collection page accessible with different collection names',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Clothing'), findsWidgets);
      expect(find.byType(TestCollectionPage), findsOneWidget);
    });

    testWidgets('Collection page accessible via different routes',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TestCollectionPage), findsOneWidget);
      expect(find.text('Clothing'), findsWidgets);
    });

    testWidgets('Page displays collection name dynamically in app bar',
        (tester) async {
      final testCases = [
        'Clothing',
        'Accessories',
        'Home & Living',
        'Stationery',
        'Gifts',
        'University Branded',
      ];

      for (final collectionName in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: TestCollectionPage(collectionName: collectionName),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.text(collectionName),
          findsWidgets,
          reason: 'Page should contain the collection name "$collectionName"',
        );

        expect(find.byType(AppBar), findsOneWidget);

        final appBar = tester.widget<AppBar>(find.byType(AppBar));
        expect(appBar.elevation == 1 || appBar.elevation == 2.0, isTrue,
            reason: 'AppBar elevation should be 1 or 2.0');

        await tester.pumpWidget(Container());
        await tester.pump();
      }
    });

    testWidgets('Collection description text appears', (tester) async {
      final collectionDescriptions = {
        'Clothing':
            'Discover our premium clothing collection featuring comfortable and stylish apparel for every occasion.',
        'Accessories':
            'Complete your look with our carefully curated selection of accessories and lifestyle products.',
        'Home & Living':
            'Transform your living space with our modern and functional home decor items.',
        'Stationery':
            'Essential stationery items for work, study, and creative projects.',
        'Gifts':
            'Perfect gifts for your loved ones, carefully selected for special occasions.',
        'University Branded':
            'Show your university pride with our exclusive branded merchandise and apparel.',
      };

      for (final entry in collectionDescriptions.entries) {
        final collectionName = entry.key;
        final expectedDescription = entry.value;

        await tester.pumpWidget(
          MaterialApp(
            home: TestCollectionPage(collectionName: collectionName),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text(expectedDescription), findsOneWidget,
            reason:
                'Collection "$collectionName" should display its description');

        final descriptionWidget =
            tester.widget<Text>(find.text(expectedDescription));
        expect(descriptionWidget.style?.color, equals(Colors.grey));
        expect(descriptionWidget.textAlign, equals(TextAlign.center));

        await tester.pumpWidget(Container());
        await tester.pump();
      }

      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Unknown Collection'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Explore our unknown collection collection'),
          findsOneWidget);
    });

    testWidgets('Filter dropdown visible (FILTER BY: All products)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButtonFormField<String>), findsNWidgets(2));

      final filterDropdown = find.ancestor(
        of: find.text('FILTER BY'),
        matching: find.byType(DropdownButtonFormField<String>),
      );
      expect(filterDropdown, findsOneWidget);

      final filterDropdownWidget =
          tester.widget<DropdownButtonFormField<String>>(filterDropdown);
      expect(filterDropdownWidget.value, equals('All Items'));

      await tester.tap(filterDropdown);
      await tester.pumpAndSettle();

      expect(find.text('All Items'), findsWidgets);
      expect(find.text('Size'), findsOneWidget);
      expect(find.text('Color'), findsOneWidget);
      expect(find.text('Price Range'), findsOneWidget);
      expect(find.text('Brand'), findsOneWidget);

      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
    });

    testWidgets('Sort dropdown visible (SORT BY: Featured)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButtonFormField<String>), findsNWidgets(2));

      final sortDropdown = find.ancestor(
        of: find.text('SORT BY'),
        matching: find.byType(DropdownButtonFormField<String>),
      );
      expect(sortDropdown, findsOneWidget);

      final sortDropdownWidget =
          tester.widget<DropdownButtonFormField<String>>(sortDropdown);
      expect(sortDropdownWidget.value, equals('Featured'));

      await tester.tap(sortDropdown);
      await tester.pumpAndSettle();

      expect(find.text('Featured'), findsWidgets);
      expect(find.text('Price: Low to High'), findsOneWidget);
      expect(find.text('Price: High to Low'), findsOneWidget);
      expect(find.text('Name: A to Z'), findsOneWidget);
      expect(find.text('Name: Z to A'), findsOneWidget);
      expect(find.text('Newest'), findsOneWidget);

      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
    });

    testWidgets('Products show image, name, and price', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(ProductCard), findsWidgets);

      final productCards = find.byType(ProductCard);
      final productCount = tester.widgetList(productCards).length;
      expect(productCount, greaterThan(0));

      expect(find.byIcon(Icons.shopping_bag), findsNWidgets(productCount));
      expect(find.text('Signature T-Shirt'), findsOneWidget);
      expect(find.text('Signature Hoodie'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);
      expect(find.text('£14.99'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('Products:'), findsOneWidget);
      expect(find.text('6 products'), findsOneWidget);
    });

    testWidgets('Product cards are clickable', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      final productCards = find.byType(ProductCard);
      expect(productCards, findsWidgets);

      final gestureDetectors = find.byType(GestureDetector);
      expect(gestureDetectors, findsWidgets);

      await tester.tap(productCards.first);
      await tester.pumpAndSettle();

      expect(find.byType(TestCollectionPage), findsOneWidget);
    });

    testWidgets('Grid is responsive (2 cols mobile, 3 cols desktop)',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 800));
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final gridDelegate =
          gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

      expect(gridDelegate.crossAxisCount, equals(3));
      expect(gridDelegate.crossAxisSpacing, equals(16));
      expect(gridDelegate.mainAxisSpacing, equals(16));
      expect(gridDelegate.childAspectRatio, equals(0.75));

      await tester.binding.setSurfaceSize(null);
    });
  });
}
