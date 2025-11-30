import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/sale_page.dart';

void main() {
  group('Sale Page Tests', () {
    testWidgets('Sale page accessible via /sale route', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Verify SalePage is displayed
      expect(find.byType(SalePage), findsOneWidget);
    });

    testWidgets('"SALE" heading displays prominently', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Verify "SALE" heading is present (case-sensitive)
      expect(find.text('SALE'), findsWidgets);
    });
  });
}
