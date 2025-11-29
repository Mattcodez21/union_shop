import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/collections_page.dart';

void main() {
  group('Collections Page Tests', () {
    testWidgets('Collections page accessible via /collections route',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Verify we start on homepage
      expect(find.text('FEATURED PRODUCTS'), findsOneWidget);

      // Scroll down to make the collections button visible
      await tester.dragUntilVisible(
        find.text('VIEW ALL COLLECTIONS'),
        find.byType(SingleChildScrollView),
        const Offset(0, -100),
      );

      // Find and tap the collections button
      final collectionsButton = find.text('VIEW ALL COLLECTIONS');
      expect(collectionsButton, findsOneWidget);

      await tester.tap(collectionsButton);
      await tester.pumpAndSettle();

      // Verify we're now on the Collections page
      expect(find.byType(CollectionsPage), findsOneWidget);

      // Check for AppBar with Collections title
      expect(find.byType(AppBar), findsOneWidget);

      // Try finding Collections text in AppBar specifically
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.title, isA<Text>());
      final titleWidget = appBar.title as Text;
      expect(titleWidget.data, equals('Collections'));

      // Verify we're no longer on homepage
      expect(find.text('FEATURED PRODUCTS'), findsNothing);

      // Verify the collections page has the expected structure
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
