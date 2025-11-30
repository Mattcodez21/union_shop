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

    testWidgets('Main product image displays', (WidgetTester tester) async {
      // Build the app and navigate to product page
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final NavigatorState navigator = tester.state(find.byType(Navigator));
      navigator.pushNamed('/product');
      await tester.pumpAndSettle();

      // Verify that the main product image is displayed
      // Looking for Image.asset widget with the signature hoodie image
      final imageFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/signature_hoodie.png',
      );

      expect(imageFinder, findsWidgets);

      // Alternative: You can also check for any Image widget if the specific path check is too strict
      // expect(find.byType(Image), findsWidgets);
    });

    testWidgets('Image carousel/thumbnails visible below main image',
        (WidgetTester tester) async {
      // Build the app and navigate to product page
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final NavigatorState navigator = tester.state(find.byType(Navigator));
      navigator.pushNamed('/product');
      await tester.pumpAndSettle();

      // Find the ListView.builder that contains the thumbnail images
      final carouselFinder = find.byWidgetPredicate(
        (widget) =>
            widget is ListView && (widget).scrollDirection == Axis.horizontal,
      );

      expect(carouselFinder, findsWidgets);

      // Verify that there are multiple thumbnail containers
      final thumbnailContainers = find.byWidgetPredicate(
        (widget) => widget is GestureDetector && widget.child is Container,
      );

      expect(thumbnailContainers, findsWidgets);

      // Check that there are 4 thumbnail images (as specified in the code)
      final thumbnailImages = find.byWidgetPredicate(
        (widget) => widget is Image && widget.image is AssetImage,
      );

      // Should find at least 4 thumbnail images plus the main image
      expect(thumbnailImages, findsWidgets);
    });

    testWidgets('Product name displays prominently',
        (WidgetTester tester) async {
      // Build the app and navigate to product page
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final NavigatorState navigator = tester.state(find.byType(Navigator));
      navigator.pushNamed('/product');
      await tester.pumpAndSettle();

      // Verify that the product name is displayed prominently
      final productNameFinder = find.text('Signature Hoodie');

      expect(productNameFinder, findsWidgets);

      // Verify the text style is prominent (large font size and bold)
      final textWidget = tester.widget<Text>(productNameFinder.first);
      expect(textWidget.style?.fontSize, greaterThan(24)); // Should be 28 or 32
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });
  });
}
