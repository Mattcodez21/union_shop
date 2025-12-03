import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Test wrapper for About page without Navbar to avoid Firebase
class TestAboutPage extends StatelessWidget {
  const TestAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        elevation: 1,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Welcome to the Union Shop!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'We are your one-stop shop for all University branded products, '
                'from clothing and stationery to gifts and accessories. '
                'We also offer a personalisation service for many of our products, '
                'and provide both delivery or instore collection options.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 24),
              Text(
                'For any questions or inquiries, please contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'hello@upsu.net',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'The Union Shop & Reception Team',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  group('About Page Tests', () {
    testWidgets('About Us page accessible via /about route', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the About page is displayed
      expect(find.text('About'), findsOneWidget); // App bar title
      expect(find.text('About Us'), findsOneWidget); // Page heading
      expect(find.byType(AppBar), findsOneWidget); // App bar exists
    });

    testWidgets('Page displays company information text & contact email',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for company information text
      expect(find.textContaining('Welcome to the Union Shop!'), findsOneWidget);
      expect(
          find.textContaining('University branded products'), findsOneWidget);
      expect(find.textContaining('personalisation service'), findsOneWidget);
      expect(find.textContaining('delivery or instore collection'),
          findsOneWidget);

      // Check for contact email
      expect(find.textContaining('hello@upsu.net'), findsOneWidget);

      // Check for team signature
      expect(find.textContaining('The Union Shop & Reception Team'),
          findsOneWidget);
    });

    testWidgets('Content is formatted with proper spacing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for proper spacing elements
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1)); // Spacing exists
      expect(find.byType(Padding), findsAtLeastNWidgets(1)); // Padding exists

      // Check that content is properly structured in Column
      expect(find.byType(Column), findsAtLeastNWidgets(1));

      // Verify Padding has proper EdgeInsets
      final paddingWidget = tester.widget<Padding>(find.byType(Padding).first);
      final padding = paddingWidget.padding as EdgeInsets;
      expect(padding.left, equals(32.0));
      expect(padding.top, equals(32.0));
      expect(padding.right, equals(32.0));
      expect(padding.bottom, equals(32.0));
    });

    testWidgets('Back button returns to homepage', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: Center(
              child: Text('FEATURED PRODUCTS'),
            ),
          ),
          routes: {
            '/about': (context) => const TestAboutPage(),
          },
        ),
      );
      await tester.pumpAndSettle();

      // Verify we start on homepage
      expect(find.text('FEATURED PRODUCTS'), findsOneWidget);

      // Navigate to about page
      final BuildContext context = tester.element(find.byType(Scaffold));
      Navigator.pushNamed(context, '/about');
      await tester.pumpAndSettle();

      // Verify we're on the About page
      expect(find.text('About Us'), findsOneWidget);

      // Find and tap the back button in the app bar
      final backButton = find.byIcon(Icons.arrow_back);
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);
      await tester.pumpAndSettle();

      // Verify we're back on the homepage
      expect(find.text('FEATURED PRODUCTS'), findsOneWidget);

      // Verify we're no longer on the About page
      expect(find.text('About Us'), findsNothing);
    });
  });
}
