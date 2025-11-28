import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('About Page Tests', () {
    testWidgets('About Us page accessible via /about route', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Find a widget that has Navigator context (like the HomeScreen)
      final BuildContext context = tester.element(find.byType(Scaffold));

      // Navigate to about page
      Navigator.pushNamed(context, '/about');
      await tester.pumpAndSettle();

      // Verify the About page is displayed
      expect(find.text('About'), findsOneWidget); // App bar title
      expect(find.text('About Us'), findsOneWidget); // Page heading
      expect(find.byType(AppBar), findsOneWidget); // App bar exists
    });
  });
}
