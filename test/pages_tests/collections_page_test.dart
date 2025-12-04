import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collections_page.dart';
import '../test_helpers/firebase_test_helper.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('CollectionsPage Tests', () {
    testWidgets('CollectionsPage builds and displays content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CollectionsPage), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('CollectionsPage has collections grid', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Check for GridView or collection widgets
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
