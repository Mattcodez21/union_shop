import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/print_shack_about_page.dart';

void main() {
  group('PrintShackAboutPage Tests', () {
    test('PrintShackAboutPage class exists', () {
      expect(PrintShackAboutPage, isNotNull);
    });

    test('PrintShackAboutPage can be instantiated', () {
      const page = PrintShackAboutPage();
      expect(page, isNotNull);
      expect(page, isA<PrintShackAboutPage>());
    });

    test('PrintShackAboutPage is a StatelessWidget', () {
      const page = PrintShackAboutPage();
      expect(page, isA<StatelessWidget>());
    });
  });
}
