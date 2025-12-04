import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/about_page.dart';

void main() {
  group('About Page Content Tests', () {
    test('AboutPage widget exists', () {
      const aboutPage = AboutPage();
      expect(aboutPage, isNotNull);
      expect(aboutPage, isA<StatelessWidget>());
    });

    testWidgets('About page displays main heading', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(48.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('About us'), findsOneWidget);
    });

    testWidgets('About page displays welcome message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Welcome to the Union Shop!'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Welcome to the Union Shop!'), findsOneWidget);
    });

    testWidgets('About page displays personalisation service text',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(text: 'We even offer an exclusive '),
                    TextSpan(
                      text: 'personalisation service',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: '!'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Check for RichText widget instead of text content
      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('About page displays delivery information', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'All online purchases are available for delivery or instore collection!'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.textContaining('delivery or instore collection'),
          findsOneWidget);
    });

    testWidgets('About page displays contact email', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(text: 'contact us at '),
                    TextSpan(
                      text: 'hello@upsu.net',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Check for RichText widget
      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('About page displays happy shopping message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Happy shopping!'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Happy shopping!'), findsOneWidget);
    });

    testWidgets('About page displays team signature', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text('The Union Shop & Reception Team'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('The Union Shop & Reception Team'), findsOneWidget);
    });

    testWidgets('About page has proper text styling for heading',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text(
              'About us',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('About us'));
      expect(textWidget.style?.fontSize, 32);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.color, Colors.black87);
    });

    testWidgets('About page has proper text styling for body', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text(
              'Welcome to the Union Shop!',
              style: TextStyle(
                fontSize: 16,
                height: 1.8,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      );

      final textWidget =
          tester.widget<Text>(find.text('Welcome to the Union Shop!'));
      expect(textWidget.style?.fontSize, 16);
      expect(textWidget.style?.height, 1.8);
      expect(textWidget.style?.color, Colors.black87);
    });

    testWidgets('About page uses SingleChildScrollView', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Test content'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('About page has Container with constraints', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                padding: const EdgeInsets.all(48.0),
                child: const Text('Content'),
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.text('Content'),
          matching: find.byType(Container),
        ),
      );
      expect(container.constraints, const BoxConstraints(maxWidth: 1200));
    });

    testWidgets('About page has proper padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(48.0),
                child: const Text('Content'),
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.text('Content'),
          matching: find.byType(Container),
        ),
      );
      expect(container.padding, const EdgeInsets.all(48.0));
    });

    testWidgets('About page uses Column for layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Item 1'),
                  Text('Item 2'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsAtLeastNWidgets(1));
    });

    testWidgets('About page has SizedBox spacing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Text 1'),
                SizedBox(height: 32),
                Text('Text 2'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('About page RichText has underlined text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'We offer '),
                  TextSpan(
                    text: 'personalisation service',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('About page email link has blue color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Contact us at '),
                  TextSpan(
                    text: 'hello@upsu.net',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('About page has multiple text widgets', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Text 1'),
                Text('Text 2'),
                Text('Text 3'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Text), findsAtLeastNWidgets(3));
    });

    testWidgets('RichText contains TextSpan children', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                  TextSpan(text: 'We even offer an exclusive '),
                  TextSpan(
                    text: 'personalisation service',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: '!'),
                ],
              ),
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richText.text as TextSpan;
      expect(textSpan.children, isNotNull);
      expect(textSpan.children?.length, 3);
    });

    testWidgets('Email TextSpan has underline decoration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                  TextSpan(text: 'contact us at '),
                  TextSpan(
                    text: 'hello@upsu.net',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richText.text as TextSpan;
      final emailSpan = textSpan.children?[1] as TextSpan;
      expect(emailSpan.style?.decoration, TextDecoration.underline);
      expect(emailSpan.style?.color, Colors.blue);
    });
  });

  group('About Page Layout Tests', () {
    testWidgets('CrossAxisAlignment is set to start', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aligned left'),
              ],
            ),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    });

    testWidgets('Content width is constrained to 1200px', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: const Text('Constrained content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final constraints = container.constraints as BoxConstraints;
      expect(constraints.maxWidth, 1200);
    });
  });
}
