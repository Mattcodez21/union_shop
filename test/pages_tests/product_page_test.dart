import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/product_page.dart';

void main() {
  group('Product Page Tests', () {
    testWidgets('Product page accessible via route',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const UnionShopApp());

      // Wait for the initial route to load
      await tester.pumpAndSettle();

      // Navigate by directly using the NavigatorState
      final NavigatorState navigator = tester.state(find.byType(Navigator));
      navigator.pushNamed('/product');

      // Rebuild the widget after navigation
      await tester.pumpAndSettle();

      // Verify that the ProductPage is displayed
      expect(find.byType(ProductPage), findsOneWidget);
    });
  });
}
