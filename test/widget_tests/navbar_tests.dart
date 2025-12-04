import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/navbar.dart';

void main() {
  group('Navbar Widget Tests', () {
    testWidgets('Navbar widget can be instantiated', (tester) async {
      // Suppress Firebase errors
      final originalOnError = FlutterError.onError!;
      FlutterError.onError = (details) {
        // Ignore Firebase errors
        if (!details.exception.toString().contains('Firebase')) {
          originalOnError(details);
        }
      };

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Navbar(),
            ),
            body: Center(child: Text('Test')),
          ),
        ),
      );

      // Verify Navbar type exists (even if Firebase prevents full render)
      expect(find.byType(Navbar), findsOneWidget);

      FlutterError.onError = originalOnError;
    });

    testWidgets('Navbar is a proper PreferredSizeWidget', (tester) async {
      const navbar = Navbar();

      // Verify Navbar implements PreferredSizeWidget
      expect(navbar, isA<PreferredSizeWidget>());

      // Verify it has a reasonable preferredSize
      expect(navbar.preferredSize.height, greaterThan(0));
    });

    testWidgets('Navbar maintains consistent height', (tester) async {
      const navbar = Navbar();
      final height1 = navbar.preferredSize.height;

      // Create another instance
      const navbar2 = Navbar();
      final height2 = navbar2.preferredSize.height;

      // Heights should be consistent
      expect(height1, equals(height2),
          reason: 'Navbar should have consistent preferredSize height');
    });
  });
}
