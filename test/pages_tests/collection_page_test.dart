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
  });
}
