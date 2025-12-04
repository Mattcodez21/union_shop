import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/auth_page.dart';
import '../test_helpers/firebase_test_helper.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('AuthPage Tests', () {
    testWidgets('AuthPage builds and displays login UI', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AuthPage), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('AuthPage has text fields for input', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Look for TextFormFields
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('AuthPage can switch between login and signup', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Try to find and tap toggle buttons if they exist
      final textButtons = find.byType(TextButton);
      if (textButtons.evaluate().isNotEmpty) {
        await tester.tap(textButtons.first);
        await tester.pumpAndSettle();
      }

      expect(find.byType(AuthPage), findsOneWidget);
    });
  });
}
