import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/about_page.dart';

void main() {
  group('AboutPage Widget Tests', () {
    test('AboutPage class exists', () {
      expect(AboutPage, isNotNull);
    });

    test('AboutPage can be instantiated', () {
      final page = AboutPage();
      expect(page, isNotNull);
      expect(page, isA<AboutPage>());
    });

    test('AboutPage is a StatelessWidget', () {
      final page = AboutPage();
      expect(page, isA<StatelessWidget>());
    });
  });
}
