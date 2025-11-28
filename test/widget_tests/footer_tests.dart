import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  testWidgets('Footer displays on at least one page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const UnionShopApp());

    // Verify the Footer widget exists
    expect(find.byType(Footer), findsOneWidget);

    // Verify footer sections are present
    expect(find.text('Opening Hours'), findsOneWidget);
    expect(find.text('Help and Information'), findsOneWidget);
    expect(find.text('Latest Offers'), findsOneWidget);
  });
}
