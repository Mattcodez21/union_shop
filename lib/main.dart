import 'package:flutter/material.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/collection_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/': (context) => const HomeScreen(), // Add this line
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/collections': (context) => const CollectionsPage(), // Add this line
      },

      onGenerateRoute: (settings) {
        // Handle /collection/[collectionName] routes
        if (settings.name!.startsWith('/collection/')) {
          final collectionName = settings.name!.split('/')[2];
          return MaterialPageRoute(
            builder: (context) => CollectionPage(
              collectionName: collectionName,
              collectionData: settings.arguments as Map<String, dynamic>?,
            ),
            settings: settings,
          );
        }

        // Return null for unknown routes (will trigger onUnknownRoute if defined)
        return null;
      },
      // Optional: Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      },
    );
  }
}
