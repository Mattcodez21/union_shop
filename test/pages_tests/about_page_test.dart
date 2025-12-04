import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/about_page.dart';

void main() {
  group('AboutPage Widget Tests', () {
    testWidgets('AboutPage renders without crashing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AboutPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AboutPage), findsOneWidget);
    });

    testWidgets('AboutPage displays title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AboutPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('About Us'), findsWidgets);
    });

    testWidgets('AboutPage has scrollable content', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AboutPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('AboutPage displays content sections', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AboutPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Check for some text content
      expect(find.byType(Text), findsWidgets);
    });
  });
}
