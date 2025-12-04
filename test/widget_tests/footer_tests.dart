import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Footer Widget Tests', () {
    testWidgets('Footer displays Opening Hours title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Opening Hours'), findsOneWidget);
    });

    testWidgets('Footer displays Winter Break Closure Dates', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('🎄 Winter Break Closure Dates 🎄'), findsOneWidget);
    });

    testWidgets('Footer displays closing date', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Closing 4pm 19/12/2025'), findsOneWidget);
    });

    testWidgets('Footer displays reopening date', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Reopening 10am 05/01/2026'), findsOneWidget);
    });

    testWidgets('Footer displays term time hours', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);
    });

    testWidgets('Footer displays Help and Information section', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Help and Information'), findsOneWidget);
    });

    testWidgets('Footer displays Search link', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('Footer displays Terms & Conditions link', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Terms & Conditions of Sale Policy'), findsOneWidget);
    });

    testWidgets('Footer displays Latest Offers section', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('Footer has email TextField', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('Footer has SUBSCRIBE button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('SUBSCRIBE'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Footer displays copyright text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('© 2025, upsu-store'), findsOneWidget);
    });

    testWidgets('Footer has social media icons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.facebook), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    });

    testWidgets('Subscribe button shows error for empty email', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      expect(find.text('Please enter an email address'), findsOneWidget);
    });

    testWidgets('Subscribe button shows error for invalid email',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'invalid-email');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('Subscribe button shows success for valid email',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      expect(find.text('Successfully subscribed to our newsletter!'),
          findsOneWidget);
    });

    testWidgets('Email field clears after successful subscription',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, isEmpty);
    });

    testWidgets('Search link is tappable', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      // Just verify the Search link exists and can be tapped
      expect(find.text('Search'), findsOneWidget);
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // The search delegate opens - we can verify by checking if there's a back button
      expect(find.byIcon(Icons.arrow_back), findsWidgets);
    });

    testWidgets('Footer has Divider', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('Subscribe button has correct colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'SUBSCRIBE'),
      );
      final style = button.style!;
      expect(
        style.backgroundColor?.resolve({}),
        const Color(0xFF4d2963),
      );
    });

    testWidgets('Footer displays Purchase online 24/7', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Purchase online 24/7'), findsOneWidget);
    });

    testWidgets('Footer displays last post date', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Last post date: 12pm on 19/12/2025'), findsOneWidget);
    });

    testWidgets('Footer displays outside term time hours', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Monday - Friday 10am - 3pm'), findsOneWidget);
    });

    testWidgets('Footer has InkWell for Search', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsAtLeastNWidgets(2));
    });

    testWidgets('Footer error SnackBar has red background', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.red);
    });

    testWidgets('Footer success SnackBar has green background', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.green);
    });

    testWidgets('Footer success SnackBar shows check icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 2000,
                child: Footer(),
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test@example.com');
      await tester.tap(find.text('SUBSCRIBE'));
      await tester.pump();

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('Email validation accepts valid formats', (tester) async {
      const validEmails = [
        'test@example.com',
        'user.name@example.co.uk',
        'first.last@sub.example.com',
      ];

      for (final email in validEmails) {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: SizedBox(
                  height: 2000,
                  child: Footer(),
                ),
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextField), email);
        await tester.tap(find.text('SUBSCRIBE'));
        await tester.pump();

        expect(find.text('Successfully subscribed to our newsletter!'),
            findsOneWidget);

        await tester.pumpWidget(Container());
      }
    });

    testWidgets('Email validation rejects invalid formats', (tester) async {
      const invalidEmails = [
        'notanemail',
        '@example.com',
        'user@',
        'user name@example.com',
      ];

      for (final email in invalidEmails) {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: SizedBox(
                  height: 2000,
                  child: Footer(),
                ),
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextField), email);
        await tester.tap(find.text('SUBSCRIBE'));
        await tester.pump();

        expect(find.text('Please enter a valid email address'), findsOneWidget);

        await tester.pumpWidget(Container());
      }
    });
  });

  group('ProductSearchDelegate Tests', () {
    testWidgets('ProductSearchDelegate has clear button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(),
                    );
                  },
                  child: const Text('Search'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.clear), findsOneWidget);
    });

    testWidgets('ProductSearchDelegate has back button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(),
                    );
                  },
                  child: const Text('Search'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('ProductSearchDelegate clear button clears query',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(),
                    );
                  },
                  child: const Text('Search'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'hoodie');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pumpAndSettle();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, isEmpty);
    });

    testWidgets('ProductSearchDelegate back button closes search',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(),
                    );
                  },
                  child: const Text('Open Search'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Search'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // After closing search, we should be back to the original button
      expect(find.text('Open Search'), findsOneWidget);
    });
  });
}
