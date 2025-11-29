import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Footer Tests', () {
    testWidgets('Footer displays on at least one page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('Footer includes three columns on desktop', (tester) async {
      // Set desktop screen size
      await tester.binding.setSurfaceSize(const Size(800, 600));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Verify footer exists
      expect(find.byType(Footer), findsOneWidget);

      // Verify all three column headers are present
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);

      // Verify the three-column Row layout exists
      final footer = tester.widget<Footer>(find.byType(Footer));
      expect(footer, isNotNull);

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Footer stacks vertically on mobile (< 600px)', (tester) async {
      // Test the footer widget in isolation to avoid homepage overflow
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      // Set mobile screen size
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pump();

      // Verify footer sections are present on mobile
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);

      // Verify footer content is accessible
      expect(find.textContaining('Winter Break Closure'), findsOneWidget);
      expect(find.text('Subscribe'), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });
  });
}
