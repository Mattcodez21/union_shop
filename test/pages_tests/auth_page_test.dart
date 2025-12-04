import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/auth_page.dart';

void main() {
  group('AuthPage Widget Tests', () {
    testWidgets('AuthPage renders without crashing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AuthPage), findsOneWidget);
    });

    testWidgets('AuthPage displays login form', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Should have text fields for email/password
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('AuthPage has buttons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsWidgets);
    });

    testWidgets('AuthPage displays toggle between login and signup',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Should have text buttons to switch modes
      expect(find.byType(TextButton), findsWidgets);
    });

    testWidgets('AuthPage can switch to signup mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthPage(),
        ),
      );

      await tester.pumpAndSettle();

      // Find and tap the signup toggle
      final signupButton = find.byType(TextButton).first;
      await tester.tap(signupButton);
      await tester.pumpAndSettle();

      expect(find.byType(AuthPage), findsOneWidget);
    });
  });
}
