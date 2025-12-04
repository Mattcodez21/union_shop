import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/data/products_data.dart';

void main() {
  group('ProductPage Widget Tests', () {
    testWidgets('ProductPage renders without crashing', (tester) async {
      final product = products.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ProductPage(productId: product.id),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ProductPage), findsOneWidget);
    });

    testWidgets('ProductPage displays product name', (tester) async {
      final product = products.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ProductPage(productId: product.id),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(product.name), findsWidgets);
    });

    testWidgets('ProductPage displays product price', (tester) async {
      final product = products.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ProductPage(productId: product.id),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('£'), findsWidgets);
    });

    testWidgets('ProductPage has add to cart button', (tester) async {
      final product = products.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ProductPage(productId: product.id),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsWidgets);
    });

    testWidgets('ProductPage displays product image', (tester) async {
      final product = products.first;

      await tester.pumpWidget(
        MaterialApp(
          home: ProductPage(productId: product.id),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });
  });
}
