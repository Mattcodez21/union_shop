import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/auth_page.dart';

void main() {
  group('Auth Page Tests', () {
    testWidgets('Auth page accessible via /auth route', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /auth route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Verify AuthPage is displayed
      expect(find.byType(AuthPage), findsOneWidget);
    });

    testWidgets('Union logo displays at top', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /auth route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Check for the union logo image (adjust asset path if needed)
      expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName.contains('upsu_logo')),
        findsAtLeastNWidgets(1),
      );
    });

    testWidgets('"Sign in" heading displays', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /auth route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Check for "Sign in" heading
      expect(find.text('Sign in'), findsWidgets);
    });

    testWidgets('Subtitle text visible', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /auth route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Check for subtitle text (adjust as needed)
      // Ensure at least one variant of subtitle text is present
      final bool subtitleFound =
          find.textContaining('sign in').evaluate().isNotEmpty ||
              find.textContaining('account').evaluate().isNotEmpty ||
              find.textContaining('continue').evaluate().isNotEmpty;
      expect(subtitleFound, isTrue);
    });

    testWidgets('"Sign in with shop" button displays', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /auth route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Check for "Sign in with shop" button
      expect(find.widgetWithText(ElevatedButton, 'Sign in with shop'),
          findsOneWidget);
    });

    testWidgets('"Continue" button displays (grey)', (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /auth route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Find a button with text "Continue"
      final continueButton = find.widgetWithText(ElevatedButton, 'Continue');
      expect(continueButton, findsOneWidget);

      // Check if the button is disabled (onPressed == null)
      final ElevatedButton buttonWidget = tester.widget(continueButton);
      expect(buttonWidget.onPressed, isNull,
          reason: 'Continue button should be disabled (grey)');
    });
  });
}
