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
  });
}
