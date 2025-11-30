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

    testWidgets('Filter and sort dropdowns present (non-functional acceptable)',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Look for filter and sort dropdowns (adjust text as needed)
      expect(find.textContaining('FILTER BY'), findsWidgets);
      expect(find.textContaining('SORT BY'), findsWidgets);
    });

    testWidgets('Product count displays', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Look for product count text (adjust text as needed, e.g., "X products")
      expect(
        find.textContaining('product'),
        findsWidgets,
      );
    });

    testWidgets('Products show images and names', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Look for product images (assume Image widgets are used)
      expect(find.byType(Image), findsWidgets);

      // Look for product names (assume they contain 'product' or adjust as needed)
      expect(find.textContaining('product', findRichText: true), findsWidgets);
    });

    testWidgets('Original price shows with strikethrough (e.g., ~~£17.00~~)',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /sale route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/sale');
      await tester.pumpAndSettle();

      // Look for a Text widget with strikethrough decoration (original price)
      final strikethroughTexts = find.byWidgetPredicate((widget) {
        if (widget is Text) {
          final style = widget.style;
          return style != null &&
              style.decoration != null &&
              style.decoration!.contains(TextDecoration.lineThrough);
        }
        return false;
      });

      expect(strikethroughTexts, findsWidgets);
    });
  });
}
