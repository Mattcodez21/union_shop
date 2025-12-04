import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/navbar.dart';
import '../test_helpers/firebase_test_helper.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('Navbar Widget Tests', () {
    testWidgets('Navbar can be instantiated and built', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Navbar(),
            ),
          ),
        ),
      );

      // Just verify it builds without errors
      expect(find.byType(Navbar), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('Navbar renders as PreferredSizeWidget', (tester) async {
      final navbar = Navbar();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: navbar,
            ),
          ),
        ),
      );

      expect(find.byType(PreferredSize), findsOneWidget);
    });

    testWidgets('Navbar contains AppBar widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Navbar(),
            ),
            body: Container(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
