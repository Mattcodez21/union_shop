import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/pages/sale_page.dart';
import 'package:union_shop/pages/auth_page.dart';
import 'package:union_shop/pages/cart_page.dart'; // <-- Add this import

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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutPage(),
        '/collections': (context) => const CollectionsPage(),
        '/sale': (context) => const SalePage(),
        '/auth': (context) => const AuthPage(),
        '/cart': (context) => const CartPage(), // <-- Add this line
      },
      onGenerateRoute: (settings) {
        // Handle /collection/[collectionName] routes
        if (settings.name!.startsWith('/collection/')) {
          final collectionName = settings.name!.split('/')[2];
          return MaterialPageRoute(
            builder: (context) => CollectionPage(
              collectionName: collectionName,
              collectionData:
                  settings.arguments as Collection?, // <-- fixed type
            ),
            settings: settings,
          );
        }
        // Handle /product route with arguments
        if (settings.name == '/product') {
          final args = settings.arguments as Map<String, dynamic>;
          final productId = args['productId'] as String;
          return MaterialPageRoute(
            builder: (context) => ProductPage(productId: productId),
            settings: settings,
          );
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      },
    );
  }
}
