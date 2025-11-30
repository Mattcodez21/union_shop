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
  });
}
