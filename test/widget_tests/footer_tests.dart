import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Footer Widget Tests', () {
    testWidgets('Footer renders and displays all sections', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
      expect(find.textContaining('Winter Break'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('SUBSCRIBE'), findsOneWidget);
    });

    testWidgets('Email subscription shows error for empty email',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      expect(find.text('Please enter an email address'), findsOneWidget);

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.red);
    });

    testWidgets('Email subscription shows error for invalid email',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'notanemail');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('Email subscription shows success for valid email',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      expect(find.text('Successfully subscribed to our newsletter!'),
          findsOneWidget);

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.green);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('Search delegate shows suggestions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // Enter search query to trigger suggestions
      await tester.enterText(find.byType(TextField).last, 'hoodie');
      await tester.pumpAndSettle();

      // Verify suggestions appear (ListTile with product names)
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('Search delegate shows results on submit', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/product': (context) => const Scaffold(body: Text('Product Page')),
          },
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // Enter search query
      await tester.enterText(find.byType(TextField).last, 'hoodie');
      await tester.pumpAndSettle();

      // Submit search (tap on a suggestion)
      final firstSuggestion = find.byType(ListTile).first;
      await tester.tap(firstSuggestion);
      await tester.pumpAndSettle();

      // Results should now be shown
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('Search delegate clear button works', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).last, 'test');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pumpAndSettle();

      // Query should be cleared
      final textField = tester.widget<TextField>(find.byType(TextField).last);
      expect(textField.controller?.text, isEmpty);
    });

    testWidgets('Search delegate back button closes search', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Back on footer
      expect(find.text('Opening Hours'), findsOneWidget);
    });

    testWidgets('Footer displays all opening hours info', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);
      expect(find.text('Monday - Friday 10am - 3pm'), findsOneWidget);
      expect(find.text('Purchase online 24/7'), findsOneWidget);
    });

    testWidgets('Footer has social media icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.facebook), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    });

    testWidgets('Footer displays copyright and divider', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('© 2025, upsu-store'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('Subscribe button has correct styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final button = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'SUBSCRIBE'),
      );

      expect(
          button.style?.backgroundColor?.resolve({}), const Color(0xFF4d2963));
      expect(button.style?.foregroundColor?.resolve({}), Colors.white);
    });

    testWidgets('Email field clears after successful subscription',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Footer(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pumpAndSettle();

      // Email field should be cleared
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, isEmpty);
    });
  });
}
