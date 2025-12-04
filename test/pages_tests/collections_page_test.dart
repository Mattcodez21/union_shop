import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collections_page.dart';

void main() {
  group('CollectionsPage Widget Tests', () {
    testWidgets('CollectionsPage renders without crashing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionsPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CollectionsPage), findsOneWidget);
    });

    testWidgets('CollectionsPage displays collections', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionsPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Should display collection cards or grid
      expect(find.byType(GridView), findsWidgets);
    });

    testWidgets('CollectionsPage has scrollable content', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionsPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomScrollView), findsWidgets);
    });

    testWidgets('CollectionsPage displays collection names', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionsPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Should have text widgets with collection names
      expect(find.byType(Text), findsWidgets);
    });
  });
}
