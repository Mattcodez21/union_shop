import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/print_shack_page.dart';

void main() {
  group('PrintShackPage Tests', () {
    test('PrintShackPage class exists', () {
      expect(PrintShackPage, isNotNull);
    });

    test('PrintShackPage can be instantiated', () {
      const page = PrintShackPage();
      expect(page, isNotNull);
      expect(page, isA<PrintShackPage>());
    });

    test('PrintShackPage is a StatefulWidget', () {
      const page = PrintShackPage();
      expect(page, isA<StatefulWidget>());
    });
  });
}
