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

    testWidgets('Layout works on mobile and desktop', (tester) async {
      // Test mobile layout
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(const UnionShopApp());
      final navigatorMobile =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigatorMobile.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Check that key widgets are present on mobile
      expect(find.text('Sign in'), findsWidgets);
      expect(find.widgetWithText(ElevatedButton, 'Continue'), findsOneWidget);

      // Test desktop layout
      await tester.binding.setSurfaceSize(const Size(1200, 800));
      await tester.pumpWidget(const UnionShopApp());
      final navigatorDesktop =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigatorDesktop.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Check that key widgets are present on desktop
      expect(find.text('Sign in'), findsWidgets);
      expect(find.widgetWithText(ElevatedButton, 'Continue'), findsOneWidget);

      // Reset surface size for other tests
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Navigation from navbar account icon works', (tester) async {
      // Ensure desktop layout so navbar is visible
      await tester.binding.setSurfaceSize(const Size(1200, 800));
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Ensure we are on the homepage (do NOT navigate to /auth first)
      // Find and tap the account icon
      final accountIcon = find.byIcon(Icons.account_circle);
      expect(accountIcon, findsOneWidget);

      // Scroll to make sure the icon is visible (if inside a scrollable)
      await tester.ensureVisible(accountIcon);

      await tester.tap(accountIcon);
      await tester.pumpAndSettle();

      // Verify we are on the auth page
      expect(find.byType(AuthPage), findsOneWidget);

      // Reset surface size for other tests
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Buttons are non-functional (acceptable for basic feature)',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());

      // Navigate to /auth route
      final navigator =
          Navigator.of(tester.element(find.byType(Scaffold).first));
      navigator.pushNamed('/auth');
      await tester.pumpAndSettle();

      // Try tapping "Continue" and "Sign in with shop" buttons
      final continueButton = find.widgetWithText(ElevatedButton, 'Continue');
      final shopButton =
          find.widgetWithText(ElevatedButton, 'Sign in with shop');

      // Both should be present
      expect(continueButton, findsOneWidget);
      expect(shopButton, findsOneWidget);

      // Tap both buttons (should not throw or navigate)
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      await tester.tap(shopButton);
      await tester.pumpAndSettle();

      // Still on AuthPage
      expect(find.byType(AuthPage), findsOneWidget);
    });
  });
}
