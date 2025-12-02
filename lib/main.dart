import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/auth_page.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/sale_page.dart';
import 'package:union_shop/pages/print_shack_page.dart';
import 'package:union_shop/pages/print_shack_about_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCx5nUqCXXYNvFDCV7bGrpbNHwzhfLCt8', // <-- your config
        authDomain: 'unionshop-aa727.firebaseapp.com',
        projectId: 'unionshop-aa727',
        storageBucket: 'unionshop-aa727.appspot.com',
        messagingSenderId: '308183404754',
        appId: '1:308183404754:web:45fae36d7be8eb1ad136b',
        measurementId: 'G-DYTYXQLJET',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
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
        '/cart': (context) => const CartPage(),
        '/print-shack': (context) => const PrintShackPage(),
        '/print-shack-about': (context) => const PrintShackAboutPage(),
      },
      onGenerateRoute: (settings) {
        // Handle /collection/[collectionName] routes
        if (settings.name != null &&
            settings.name!.startsWith('/collection/')) {
          final collectionName = settings.name!.split('/')[2];
          return MaterialPageRoute(
            builder: (context) => CollectionPage(
              collectionName: collectionName,
              collectionData: settings.arguments as Collection?,
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
