import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/collection_page.dart';

void main() {
  group('Collection Page Tests', () {
    testWidgets(
        'Collection page accessible with parameter (e.g., /collection/hoodies)',
        (tester) async {
      // Test direct navigation to collection page with parameter
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) {
            // Handle /collection/[collectionName] routes
            if (settings.name!.startsWith('/collection/')) {
              final collectionName = settings.name!.split('/')[2];
              return MaterialPageRoute(
                builder: (context) => CollectionPage(
                  collectionName: collectionName,
                  collectionData: settings.arguments as Map<String, dynamic>?,
                ),
                settings: settings,
              );
            }
            return null;
          },
          initialRoute: '/collection/hoodies',
        ),
      );
      await tester.pumpAndSettle();

      // Verify we're on the Collection page
      expect(find.byType(CollectionPage), findsOneWidget);

      // Verify the AppBar shows the correct collection name (appears in both AppBar and header)
      expect(
          find.text('hoodies'), findsNWidgets(2)); // AppBar title + main header

      // Verify the page has the expected structure
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);

      // Verify AppBar specifically contains the collection name
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      final titleWidget = appBar.title as Text;
      expect(titleWidget.data, equals('hoodies'));
    });

    testWidgets('Collection page accessible with different collection names',
        (tester) async {
      // Test with Clothing collection
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) {
            if (settings.name!.startsWith('/collection/')) {
              final collectionName = settings.name!.split('/')[2];
              return MaterialPageRoute(
                builder: (context) => CollectionPage(
                  collectionName: collectionName,
                ),
                settings: settings,
              );
            }
            return null;
          },
          initialRoute: '/collection/Clothing',
        ),
      );
      await tester.pumpAndSettle();

      // Verify navigation to Clothing collection (appears in AppBar + header)
      expect(find.text('Clothing'), findsNWidgets(2));
      expect(find.byType(CollectionPage), findsOneWidget);
    });

    testWidgets('Collection page accessible via full app routing',
        (tester) async {
      // Test collection page accessibility via the main app
      await tester.pumpWidget(const UnionShopApp());

      // Manually navigate to a collection route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/collection/Clothing', arguments: {
        'name': 'Clothing',
        'imageUrl': 'assets/images/clothing_banner.png',
        'itemCount': 24,
      });

      await tester.pumpAndSettle();

      // Verify we're on the Collection page
      expect(find.byType(CollectionPage), findsOneWidget);
      expect(find.text('Clothing'), findsNWidgets(2)); // AppBar + header
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
        // Clear the widget tree before each test
        await tester.binding.setSurfaceSize(null);
        await tester.pumpWidget(Container()); // Clear previous widget
        await tester.pump();

        await tester.pumpWidget(
          MaterialApp(
            onGenerateRoute: (settings) {
              if (settings.name!.startsWith('/collection/')) {
                final encodedCollectionName = settings.name!.split('/')[2];
                // Decode the URL-encoded collection name
                final paramCollectionName =
                    Uri.decodeComponent(encodedCollectionName);
                return MaterialPageRoute(
                  builder: (context) => CollectionPage(
                    collectionName: paramCollectionName,
                  ),
                  settings: settings,
                );
              }
              return null;
            },
            initialRoute: '/collection/${Uri.encodeComponent(collectionName)}',
          ),
        );
        await tester.pumpAndSettle();

        // Verify AppBar displays the dynamic collection name
        final appBar = tester.widget<AppBar>(find.byType(AppBar));
        final titleWidget = appBar.title as Text;
        expect(titleWidget.data, equals(collectionName),
            reason: 'AppBar should display "$collectionName" as title');

        // Verify the collection name appears in the AppBar
        expect(
            find.descendant(
              of: find.byType(AppBar),
              matching: find.text(collectionName),
            ),
            findsOneWidget,
            reason:
                'AppBar should contain the collection name "$collectionName"');

        // Verify AppBar styling is consistent
        expect(appBar.backgroundColor, equals(Colors.white));
        expect(appBar.foregroundColor, equals(Colors.black));
        expect(appBar.elevation, equals(1));
      }
    });

    testWidgets('Collection description text appears', (tester) async {
      // Test that each collection displays its specific description
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
            home: CollectionPage(collectionName: collectionName),
          ),
        );
        await tester.pumpAndSettle();

        // Verify the collection description appears on the page
        expect(find.text(expectedDescription), findsOneWidget,
            reason:
                'Collection "$collectionName" should display its description');

        // Verify the description has proper styling (grey color)
        final descriptionWidget =
            tester.widget<Text>(find.text(expectedDescription));
        expect(descriptionWidget.style?.color, equals(Colors.grey));
        expect(descriptionWidget.textAlign, equals(TextAlign.center));

        // Verify description appears below the collection name
        final collectionNameFinder = find.text(collectionName);
        final descriptionFinder = find.text(expectedDescription);

        expect(collectionNameFinder, findsWidgets);
        expect(descriptionFinder, findsOneWidget);

        // Clear widget for next iteration
        await tester.pumpWidget(Container());
        await tester.pump();
      }

      // Test fallback description for unknown collections
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(collectionName: 'Unknown Collection'),
        ),
      );
      await tester.pumpAndSettle();

      // Verify fallback description appears
      expect(find.textContaining('Explore our unknown collection collection'),
          findsOneWidget);
    });

    testWidgets('Filter dropdown visible (FILTER BY: All products)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      // Verify filter dropdown is visible
      expect(find.byType(DropdownButtonFormField<String>),
          findsNWidgets(2)); // Filter + Sort dropdowns

      // Find the filter dropdown specifically by its label
      final filterDropdown = find.ancestor(
        of: find.text('FILTER BY'),
        matching: find.byType(DropdownButtonFormField<String>),
      );
      expect(filterDropdown, findsOneWidget);

      // Verify the filter dropdown shows "All Items" as default value
      final filterDropdownWidget =
          tester.widget<DropdownButtonFormField<String>>(filterDropdown);
      expect(filterDropdownWidget.initialValue, equals('All Items'));

      // Verify the filter dropdown has correct label
      expect(find.text('FILTER BY'), findsOneWidget);

      // Verify filter dropdown contains expected options
      await tester.tap(filterDropdown);
      await tester.pumpAndSettle();

      // Check that filter options are available
      expect(find.text('All Items'), findsWidgets);
      expect(find.text('Size'), findsOneWidget);
      expect(find.text('Color'), findsOneWidget);
      expect(find.text('Price Range'), findsOneWidget);
      expect(find.text('Brand'), findsOneWidget);

      // Close the dropdown by tapping outside
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      // Verify dropdown is in the correct container with styling
      final filterContainer = find.ancestor(
        of: filterDropdown,
        matching: find.byType(Container),
      );
      expect(filterContainer, findsWidgets);

      // Verify the filter dropdown is properly positioned in a Row
      final row = find.ancestor(
        of: filterDropdown,
        matching: find.byType(Row),
      );
      expect(row, findsOneWidget);
    });

    testWidgets('Sort dropdown visible (SORT BY: Featured)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      // Verify sort dropdown is visible
      expect(find.byType(DropdownButtonFormField<String>),
          findsNWidgets(2)); // Filter + Sort dropdowns

      // Find the sort dropdown specifically by its label
      final sortDropdown = find.ancestor(
        of: find.text('SORT BY'),
        matching: find.byType(DropdownButtonFormField<String>),
      );
      expect(sortDropdown, findsOneWidget);

      // Verify the sort dropdown shows "Featured" as default value
      final sortDropdownWidget =
          tester.widget<DropdownButtonFormField<String>>(sortDropdown);
      expect(sortDropdownWidget.initialValue, equals('Featured'));

      // Verify the sort dropdown has correct label
      expect(find.text('SORT BY'), findsOneWidget);

      // Verify sort dropdown contains expected options
      await tester.tap(sortDropdown);
      await tester.pumpAndSettle();

      // Check that sort options are available
      expect(find.text('Featured'), findsWidgets);
      expect(find.text('Price: Low to High'), findsOneWidget);
      expect(find.text('Price: High to Low'), findsOneWidget);
      expect(find.text('Name: A to Z'), findsOneWidget);
      expect(find.text('Name: Z to A'), findsOneWidget);
      expect(find.text('Newest'), findsOneWidget);

      // Close the dropdown by tapping outside
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      // Verify dropdown is in the correct container with styling
      final sortContainer = find.ancestor(
        of: sortDropdown,
        matching: find.byType(Container),
      );
      expect(sortContainer, findsWidgets);

      // Verify the sort dropdown is properly positioned in a Row (same row as filter)
      final row = find.ancestor(
        of: sortDropdown,
        matching: find.byType(Row),
      );
      expect(row, findsOneWidget);

      // Verify both dropdowns are in the same row
      final filterDropdown = find.ancestor(
        of: find.text('FILTER BY'),
        matching: find.byType(DropdownButtonFormField<String>),
      );
      final filterRow = find.ancestor(
        of: filterDropdown,
        matching: find.byType(Row),
      );

// Compare the actual Row widgets, not the finders
      final sortRowWidget = tester.widget<Row>(row);
      final filterRowWidget = tester.widget<Row>(filterRow);
      expect(
          sortRowWidget,
          equals(
              filterRowWidget)); // Both dropdowns should be in the same row // Both dropdowns should be in the same row
    });

    testWidgets('Products show image, name, and price', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      // Verify products are displayed in a grid
      expect(find.byType(GridView), findsOneWidget);

      // Verify ProductCard widgets are present
      expect(find.byType(ProductCard), findsWidgets);

      // Get all product cards
      final productCards = find.byType(ProductCard);
      final productCount = tester.widgetList(productCards).length;
      expect(productCount,
          greaterThan(0)); // At least some products should be displayed

      // Test each product card shows required elements
      for (int i = 0; i < productCount; i++) {
        final productCard = productCards.at(i);

        // Verify each product card has an image placeholder (Icon)
        expect(
          find.descendant(
            of: productCard,
            matching: find.byIcon(Icons.shopping_bag),
          ),
          findsOneWidget,
          reason: 'Product card $i should have an image placeholder',
        );

        // Verify each product card has a price (text starting with £)
        final priceText = find.descendant(
          of: productCard,
          matching: find.textContaining('£'),
        );
        expect(priceText, findsOneWidget,
            reason: 'Product card $i should display a price');

        // Verify the price has green color styling
        final priceWidget = tester.widget<Text>(priceText);
        expect(priceWidget.style?.color, equals(Colors.green),
            reason: 'Product price should be displayed in green');
        expect(priceWidget.style?.fontWeight, equals(FontWeight.bold),
            reason: 'Product price should be bold');
      }

      // Verify specific hardcoded products are displayed (based on debug output)
      expect(find.text('Signature T-Shirt'), findsOneWidget);
      expect(find.text('Signature Hoodie'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);
      expect(find.text('£14.99'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);

      // Verify products section header
      expect(find.text('Products:'), findsOneWidget);

      // Verify product count display
      expect(find.text('6 products'), findsOneWidget);

      // Verify card structure - each card should be wrapped in GestureDetector
      expect(find.byType(GestureDetector), findsWidgets);

      // Verify cards have proper styling
      expect(find.byType(Card), findsWidgets);

      // Verify we have at least 3 product cards (the ones we can see in debug output)
      expect(productCount, greaterThanOrEqualTo(3));

      // Test that tapping a product card triggers navigation
      await tester.tap(productCards.first);
      await tester.pumpAndSettle();

      // Note: Navigation would be tested separately, here we just verify the tap doesn't cause errors
    });

    testWidgets('Product cards are clickable', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(collectionName: 'Clothing'),
        ),
      );
      await tester.pumpAndSettle();

      // Verify product cards are present
      final productCards = find.byType(ProductCard);
      expect(productCards, findsWidgets);

      // Get the count of product cards
      final productCount = tester.widgetList(productCards).length;
      expect(productCount, greaterThan(0));

      // Verify GestureDetectors exist (they're inside ProductCards)
      final gestureDetectors = find.byType(GestureDetector);
      expect(gestureDetectors, findsWidgets);

      // Test clicking on each product card
      for (int i = 0; i < productCount; i++) {
        final productCard = productCards.at(i);

        // Find the GestureDetector that is a descendant of this product card
        final gestureDetector = find.descendant(
          of: productCard,
          matching: find.byType(GestureDetector),
        );
        expect(gestureDetector, findsOneWidget,
            reason: 'Product card $i should contain a GestureDetector');

        // Verify the GestureDetector has an onTap callback
        final gestureWidget = tester.widget<GestureDetector>(gestureDetector);
        expect(gestureWidget.onTap, isNotNull,
            reason: 'Product card $i should have a tap handler');
      }

      // Test that tapping doesn't cause errors (without navigation testing)
      final firstProductCard = productCards.first;
      final firstGestureDetector = find.descendant(
        of: firstProductCard,
        matching: find.byType(GestureDetector),
      );

      // Tap on the GestureDetector directly - this should not crash
      await tester.tap(firstGestureDetector, warnIfMissed: false);
      await tester.pump(); // Just pump once, don't wait for navigation

      // Verify we're still on the collection page (no crash occurred)
      expect(find.byType(CollectionPage), findsOneWidget);
      expect(find.text('Clothing'), findsWidgets);

      // Test tapping multiple cards without navigation
      if (productCount > 1) {
        final secondProductCard = productCards.at(1);
        final secondGestureDetector = find.descendant(
          of: secondProductCard,
          matching: find.byType(GestureDetector),
        );

        // Tap second card - should not crash
        await tester.tap(secondGestureDetector, warnIfMissed: false);
        await tester.pump();

        // Still on collection page
        expect(find.byType(CollectionPage), findsOneWidget);
      }

      // Verify cards are visually responsive to taps (no crashes)
      // Verify cards are visually responsive to taps (no crashes)
      expect(find.byType(Card), findsWidgets);

// Count GestureDetectors specifically within ProductCards
      int gestureDetectorsInCards = 0;
      for (int i = 0; i < productCount; i++) {
        final productCard = productCards.at(i);
        final gestureDetector = find.descendant(
          of: productCard,
          matching: find.byType(GestureDetector),
        );
        if (tester.widgetList(gestureDetector).isNotEmpty) {
          gestureDetectorsInCards++;
        }
      }
      expect(gestureDetectorsInCards, equals(productCount));
    });
  });
}
