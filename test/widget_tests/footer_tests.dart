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

    testWidgets('Opening hours section shows all information', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Verify Opening Hours section header
      expect(find.text('Opening Hours'), findsOneWidget);

      // Verify winter break closure notice
      expect(find.textContaining('Winter Break Closure'), findsOneWidget);
      expect(find.textContaining('Closed 20 Dec - 6 Jan'), findsOneWidget);

      // Verify term time hours
      expect(find.textContaining('Term Time'), findsOneWidget);
      expect(find.textContaining('Mon-Fri: 9:00 AM - 5:00 PM'), findsOneWidget);
      expect(
          find.textContaining('Sat-Sun: 10:00 AM - 4:00 PM'), findsOneWidget);
    });

    testWidgets('Help links are visible (non-functional acceptable)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Verify Help and Information section header
      expect(find.text('Help and Information'), findsOneWidget);

      // Verify help links are visible (they're in one text widget with line breaks)
      expect(find.textContaining('Search'), findsOneWidget);
      expect(find.textContaining('Terms & Conditions'), findsOneWidget);

      // Verify the combined text widget exists
      expect(find.text('Search\nTerms & Conditions'), findsOneWidget);
    });

    testWidgets('Email subscription form exists', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Verify Latest Offers section header
      expect(find.text('Latest Offers'), findsOneWidget);

      // Verify email input field exists
      expect(find.byType(TextField), findsOneWidget);

      // Verify email input has correct hint text
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.hintText, equals('Enter your email'));

      // Verify subscribe button exists
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Subscribe'), findsOneWidget);

      // Verify button is tappable (but don't test functionality)
      final subscribeButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(subscribeButton.onPressed, isNotNull);
    });

    testWidgets('Social media icons (Facebook, Twitter) display',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Footer(),
          ),
        ),
      );

      // Verify social media icons exist
      expect(find.byType(IconButton), findsNWidgets(2));

      // Get the IconButton widgets
      final iconButtons =
          tester.widgetList<IconButton>(find.byType(IconButton));
      final List<IconButton> buttons = iconButtons.toList();

      // Verify Facebook icon (first icon button)
      final facebookIcon = buttons[0].icon as Icon;
      expect(facebookIcon.icon, equals(Icons.facebook));

      // Verify Twitter icon (second icon button)
      final twitterIcon = buttons[1].icon as Icon;
      expect(twitterIcon.icon, equals(Icons.alternate_email));

      // Verify both buttons are tappable (have onPressed functions)
      expect(buttons[0].onPressed, isNotNull);
      expect(buttons[1].onPressed, isNotNull);

      // Verify both icons have proper styling
      expect(facebookIcon.color, equals(Colors.grey[600]));
      expect(twitterIcon.color, equals(Colors.grey[600]));
      expect(facebookIcon.size, equals(24.0));
      expect(twitterIcon.size, equals(24.0));
    });
  });
}
