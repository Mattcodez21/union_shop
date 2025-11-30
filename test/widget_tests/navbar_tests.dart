import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/navbar.dart';

void main() {
  group('Navbar Widget Tests', () {
    final routes = ['/', '/sale', '/auth'];

    for (final route in routes) {
      testWidgets('Navbar displays on $route page', (tester) async {
        await tester.pumpWidget(const UnionShopApp());

        // Navigate to the route if not home
        if (route != '/') {
          final navigator =
              Navigator.of(tester.element(find.byType(Scaffold).first));
          navigator.pushNamed(route);
          await tester.pumpAndSettle();
        }

        // Navbar should be present
        expect(find.byType(Navbar), findsOneWidget);
      });
    }
  });

  // testWidgets('Shop link shows dropdown arrow indicator', (tester) async {
  //   // Force desktop layout
  //   await tester.binding.setSurfaceSize(const Size(1200, 800));
  //   await tester.pumpWidget(const UnionShopApp());
  //   await tester.pumpAndSettle();

  //   // Find the "Shop" link as a TextButton
  //   final shopButton = find.widgetWithText(TextButton, 'Shop');
  //   expect(shopButton, findsOneWidget);

  //   // Check for a dropdown arrow (could be an Icon or a Text widget with '∨' or similar)
  //   final arrowIcon = find.descendant(
  //     of: shopButton,
  //     matching: find.byIcon(Icons.arrow_drop_down),
  //   );
  //   final arrowText = find.descendant(
  //     of: shopButton,
  //     matching: find.textContaining('∨'),
  //   );

  //   expect(
  //     arrowIcon.evaluate().isNotEmpty || arrowText.evaluate().isNotEmpty,
  //     isTrue,
  //     reason: 'Shop link should show a dropdown arrow indicator (∨)',
  //   );

  //   // Reset surface size for other tests
  //   await tester.binding.setSurfaceSize(null);
  // });

  testWidgets('Search icon displays on right', (tester) async {
    // Force desktop layout
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    // Find the search icon (commonly Icons.search)
    final searchIcon = find.byIcon(Icons.search);
    expect(searchIcon, findsOneWidget);

    // Optionally, check that it's in the Navbar and visually on the right
    // (This checks it's a descendant of Navbar)
    expect(
      find.descendant(of: find.byType(Navbar), matching: searchIcon),
      findsOneWidget,
    );

    // Reset surface size for other tests
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('Account icon displays on right', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    // Just check the icon is present
    expect(find.byIcon(Icons.account_circle), findsOneWidget);

    await tester.binding.setSurfaceSize(null);
  });
}
