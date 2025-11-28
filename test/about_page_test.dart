import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('About Page Tests', () {
    testWidgets('About Us page accessible via /about route', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      final BuildContext context = tester.element(find.byType(MaterialApp));
      Navigator.pushNamed(context, '/about');

      await tester.pumpAndSettle();

      expect(find.text('About'), findsOneWidget);
      expect(find.text('About Us'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
