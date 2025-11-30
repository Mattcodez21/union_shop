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

    testWidgets('Promotional message appears below title', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Look for a promotional message below the "SALE" heading.
      // Adjust the text below to match your actual promotional message.
      final promoFinder = find.textContaining('off').evaluate().isNotEmpty
          ? find.textContaining('off')
          : find.textContaining('discount');
      expect(promoFinder, findsWidgets);
    });

    testWidgets('Discount notice visible', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Look for a discount notice (adjust the text as needed)
      final discountFound =
          find.textContaining('discount').evaluate().isNotEmpty;
      final percentFound = find.textContaining('%').evaluate().isNotEmpty;
      expect(discountFound || percentFound, isTrue);
    });
  });
}
