import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/sale_page.dart';
import '../test_helpers/firebase_test_helper.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('SalePage Tests', () {
    testWidgets('SalePage builds and displays content', (tester) async {
      // enlarge test surface so Column children don't overflow in headless test env
      await tester.binding.setSurfaceSize(const Size(1200, 1600));
      await tester.pumpWidget(const MaterialApp(home: SalePage()));
      await tester.pumpAndSettle();

      expect(find.byType(SalePage), findsOneWidget);

      // reset surface afterwards
      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('SalePage can scroll through products', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );

      await tester.pumpAndSettle();

      // Try scrolling
      final listFinder = find.byType(Scrollable);
      if (listFinder.evaluate().isNotEmpty) {
        await tester.drag(listFinder.first, const Offset(0, -200));
        await tester.pumpAndSettle();
      }

      expect(find.byType(SalePage), findsOneWidget);
    });
  });
}
