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

    testWidgets('Page displays company information text & contact email',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to about page
      final BuildContext context = tester.element(find.byType(Scaffold));
      Navigator.pushNamed(context, '/about');
      await tester.pumpAndSettle();

      // Check for company information text
      expect(find.textContaining('Welcome to the Union Shop!'), findsOneWidget);
      expect(
          find.textContaining('University branded products'), findsOneWidget);
      expect(find.textContaining('personalisation service'), findsOneWidget);
      expect(find.textContaining('delivery or instore collection'),
          findsOneWidget);

      // Check for contact email
      expect(find.textContaining('hello@upsu.net'), findsOneWidget);

      // Check for team signature
      expect(find.textContaining('The Union Shop & Reception Team'),
          findsOneWidget);
    });

    testWidgets('Content is formatted with proper spacing', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to about page
      final BuildContext context = tester.element(find.byType(Scaffold));
      Navigator.pushNamed(context, '/about');
      await tester.pumpAndSettle();

      // Check for proper spacing elements
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1)); // Spacing exists
      expect(find.byType(Padding), findsAtLeastNWidgets(1)); // Padding exists

      // Check that content is properly structured in Column
      expect(find.byType(Column), findsAtLeastNWidgets(1));

      // Verify Container has proper padding
      final containerWidget = tester.widget<Container>(find.byType(Container));
      expect(containerWidget.padding, isNotNull);

      // Check the padding values correctly
      final padding = containerWidget.padding as EdgeInsets;
      expect(padding.left, equals(16.0));
      expect(padding.top, equals(16.0));
      expect(padding.right, equals(16.0));
      expect(padding.bottom, equals(16.0));
    });
  });
}
