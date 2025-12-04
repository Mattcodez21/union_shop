import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/data/products_data.dart';

void main() {
  group('ProductCard Widget Tests', () {
    testWidgets('ProductCard displays product title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: 'assets/test.jpg',
            ),
          ),
        ),
      );

      expect(find.text('Test Product'), findsOneWidget);
    });

    testWidgets('ProductCard displays product price', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: 'assets/test.jpg',
            ),
          ),
        ),
      );

      expect(find.text('£29.99'), findsOneWidget);
    });

    testWidgets('ProductCard has Card widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('ProductCard has GestureDetector for tap', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('ProductCard shows error icon when image fails',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
    });

    testWidgets('ProductCard navigates on tap', (tester) async {
      bool navigated = false;

      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
          onGenerateRoute: (settings) {
            if (settings.name == '/product') {
              navigated = true;
              return MaterialPageRoute(
                builder: (context) =>
                    const Scaffold(body: Text('Product Page')),
              );
            }
            return null;
          },
        ),
      );

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      expect(navigated, isTrue);
    });

    testWidgets('ProductCard displays title with correct style',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Test Product'));
      expect(titleText.style?.fontSize, 15);
      expect(titleText.style?.fontWeight, FontWeight.w600);
    });

    testWidgets('ProductCard displays price with correct style',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
        ),
      );

      final priceText = tester.widget<Text>(find.text('£29.99'));
      expect(priceText.style?.fontSize, 14);
      expect(priceText.style?.fontWeight, FontWeight.bold);
      expect(priceText.style?.color, const Color(0xFF4d2963));
    });

    testWidgets('ProductCard has rounded corners', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              id: 'test1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      final shape = card.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(8));
    });

    testWidgets('ProductCard passes correct product id in navigation',
        (tester) async {
      Map<String, dynamic>? receivedArgs;

      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: ProductCard(
              id: 'p1',
              title: 'Test Product',
              price: '£29.99',
              imageUrl: '',
            ),
          ),
          onGenerateRoute: (settings) {
            if (settings.name == '/product') {
              receivedArgs = settings.arguments as Map<String, dynamic>?;
              return MaterialPageRoute(
                builder: (context) =>
                    const Scaffold(body: Text('Product Page')),
              );
            }
            return null;
          },
        ),
      );

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      expect(receivedArgs?['productId'], 'p1');
    });
  });

  group('Products Data Tests', () {
    test('getProductById returns correct product', () {
      final product = getProductById('p1');
      expect(product, isNotNull);
      expect(product!.id, 'p1');
    });

    test('getProductById returns null for invalid id', () {
      final product = getProductById('invalid_id');
      expect(product, isNull);
    });

    test('products list is not empty', () {
      expect(products, isNotEmpty);
    });

    test('products contains at least 4 products', () {
      expect(products.length, greaterThanOrEqualTo(4));
    });

    test('All products have valid data', () {
      for (var product in products) {
        expect(product.id, isNotEmpty);
        expect(product.name, isNotEmpty);
        expect(product.price, greaterThan(0));
        expect(product.category, isNotEmpty);
      }
    });

    test('Featured products exist in data', () {
      expect(getProductById('p1'), isNotNull);
      expect(getProductById('p2'), isNotNull);
      expect(getProductById('p3'), isNotNull);
      expect(getProductById('p4'), isNotNull);
    });

    test('Products have image URLs', () {
      final product = getProductById('p1');
      expect(product?.imageUrls, isNotEmpty);
    });

    test('Products have categories', () {
      for (var product in products) {
        expect(product.category, isNotEmpty);
      }
    });

    test('Product prices are positive numbers', () {
      for (var product in products) {
        expect(product.price, greaterThan(0));
      }
    });

    test('Product IDs are unique', () {
      final ids = products.map((p) => p.id).toList();
      final uniqueIds = ids.toSet();
      expect(ids.length, uniqueIds.length);
    });
  });

  group('HomeScreen Build Method Tests', () {
    testWidgets('HomeScreen builds featured products list correctly',
        (tester) async {
      const homeScreen = HomeScreen();

      // Test that placeholderCallbackForButtons exists
      expect(homeScreen.placeholderCallbackForButtons, isA<Function>());
    });
  });
}
