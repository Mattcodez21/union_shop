import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collection_page.dart';

void main() {
  group('CollectionPage Widget Tests', () {
    testWidgets('CollectionPage renders without crashing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(
            collectionName: 'Clothing',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CollectionPage), findsOneWidget);
    });

    testWidgets('CollectionPage displays collection name', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(
            collectionName: 'Accessories',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Accessories'), findsWidgets);
    });

    testWidgets('CollectionPage displays text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(
            collectionName: 'Stationery',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('CollectionPage has dropdowns', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(
            collectionName: 'Clothing',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(DropdownButtonFormField), findsWidgets);
    });

    testWidgets('CollectionPage has clear filters button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CollectionPage(
            collectionName: 'Clothing',
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Clear Filters'), findsOneWidget);
    });
  });
}
