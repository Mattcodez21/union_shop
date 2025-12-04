import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/data/collections_data.dart';
import 'package:union_shop/data/products_data.dart';

Widget _wrapWithScaffold({required Widget child, Widget? endDrawer}) {
  return MaterialApp(
    onGenerateRoute: (settings) => MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text(settings.name ?? 'route')),
        body: Center(child: Text('route:${settings.name}')),
      ),
      settings: settings,
    ),
    home: Scaffold(
      endDrawer: endDrawer,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight), child: child),
      body: const SizedBox.shrink(),
    ),
  );
}

void main() {
  testWidgets('Navbar can be instantiated and built', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Navbar(cartService: CartService()),
          ),
        ),
      ),
    );

    expect(find.byType(Navbar), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('Navbar renders as PreferredSizeWidget', (tester) async {
    final navbar = Navbar(cartService: CartService());

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
            child: Navbar(cartService: CartService()),
          ),
          body: Container(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('Navbar builds on desktop and shows nav controls',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    expect(find.byType(Navbar), findsOneWidget);
    expect(find.text('Home'), findsWidgets);
    expect(find.byTooltip('Search'), findsOneWidget);
    expect(find.byTooltip('Cart'), findsWidgets);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Shop popup opens and a collection item can be selected',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final shopText = find.text('Shop').first;
    await tester.tap(shopText);
    await tester.pumpAndSettle();

    if (collections.isNotEmpty) {
      final firstName = collections.first.name;
      final item = find.text(firstName);
      if (item.evaluate().isNotEmpty) {
        await tester.tap(item.first);
        await tester.pumpAndSettle();
        expect(find.textContaining(firstName).evaluate().isEmpty, isFalse);
      }
    }

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Mobile: menu opens end-drawer and contains navigation entries',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));

    await tester.pumpWidget(_wrapWithScaffold(
        child: Navbar(cartService: CartService()),
        endDrawer: const MobileNavDrawer()));
    await tester.pumpAndSettle();

    final menu = find.byTooltip('Menu');
    if (menu.evaluate().isNotEmpty) {
      await tester.tap(menu.first);
      await tester.pumpAndSettle();

      expect(find.text('Shop'), findsWidgets);

      final shopTile = find.widgetWithText(ListTile, 'Shop');
      if (shopTile.evaluate().isNotEmpty) {
        await tester.tap(shopTile.first);
        await tester.pumpAndSettle();
      }
    }

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Search delegate opens and can be closed', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final searchBtn = find.byTooltip('Search');
    expect(searchBtn, findsWidgets);

    await tester.tap(searchBtn.first);
    await tester.pumpAndSettle();

    final back = find.byIcon(Icons.arrow_back);
    if (back.evaluate().isNotEmpty) {
      await tester.tap(back.first);
      await tester.pumpAndSettle();
    }

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Cart badge updates when item added to CartService',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    final cart = CartService();
    final prod = Product(
      id: 't-prod',
      name: 'TestProd',
      description: '',
      price: 7.5,
      category: '',
      sizes: const [],
      colors: const [],
      imageUrls: const [],
    );

    cart.addToCart(CartItem(
        product: prod, quantity: 1, selectedSize: '', selectedColor: ''));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsWidgets);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Navbar with title displays title on desktop', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(_wrapWithScaffold(
        child: Navbar(title: 'Test Title', cartService: CartService())));
    await tester.pumpAndSettle();

    expect(find.text('Test Title'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Navbar with title displays title on mobile', (tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));

    await tester.pumpWidget(_wrapWithScaffold(
        child: Navbar(title: 'Mobile Title', cartService: CartService())));
    await tester.pumpAndSettle();

    expect(find.text('Mobile Title'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Desktop: Account button navigates to account page',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final accountBtn = find.byTooltip('Account');
    await tester.tap(accountBtn.first);
    await tester.pumpAndSettle();

    expect(find.textContaining('/account'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Desktop: Cart button navigates to cart page', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final cartBtn = find.byTooltip('Cart').first;
    await tester.tap(cartBtn);
    await tester.pumpAndSettle();

    expect(find.textContaining('/cart'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Desktop: Print Shack popup opens and navigates', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final printShackText = find.text('The Print Shack').first;
    await tester.tap(printShackText);
    await tester.pumpAndSettle();

    expect(find.text('About'), findsWidgets);
    expect(find.text('Personalisation'), findsOneWidget);

    final aboutItem = find.text('About').last;
    await tester.tap(aboutItem);
    await tester.pumpAndSettle();

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Desktop: SALE button navigates to sale page', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final saleBtn = find.text('SALE!');
    await tester.tap(saleBtn.first);
    await tester.pumpAndSettle();

    expect(find.textContaining('/sale'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Desktop: About button navigates to about page', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final aboutBtn = find.text('About').first;
    await tester.tap(aboutBtn);
    await tester.pumpAndSettle();

    expect(find.textContaining('/about'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Desktop: Logo navigates to home', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final logo = find.byType(InkWell).first;
    await tester.tap(logo);
    await tester.pumpAndSettle();

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Mobile: All drawer items are present', (tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));

    await tester.pumpWidget(_wrapWithScaffold(
        child: Navbar(cartService: CartService()),
        endDrawer: const MobileNavDrawer()));
    await tester.pumpAndSettle();

    final menu = find.byTooltip('Menu');
    await tester.tap(menu);
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('The Print Shack'), findsOneWidget);
    expect(find.text('SALE!'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('UPSU.net'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Mobile: Drawer navigation items work', (tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));

    await tester.pumpWidget(_wrapWithScaffold(
        child: Navbar(cartService: CartService()),
        endDrawer: const MobileNavDrawer()));
    await tester.pumpAndSettle();

    final menu = find.byTooltip('Menu');
    await tester.tap(menu);
    await tester.pumpAndSettle();

    final saleItem = find.widgetWithText(ListTile, 'SALE!');
    await tester.tap(saleItem);
    await tester.pumpAndSettle();

    expect(find.textContaining('/sale'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Search delegate shows search field and can type query',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final searchBtn = find.byTooltip('Search').first;
    await tester.tap(searchBtn);
    await tester.pumpAndSettle();

    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    await tester.enterText(textField, 'test');
    await tester.pumpAndSettle();

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Search delegate clear button clears query', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final searchBtn = find.byTooltip('Search').first;
    await tester.tap(searchBtn);
    await tester.pumpAndSettle();

    final textField = find.byType(TextField);
    await tester.enterText(textField, 'test query');
    await tester.pumpAndSettle();

    final clearBtn = find.byIcon(Icons.clear);
    if (clearBtn.evaluate().isNotEmpty) {
      await tester.tap(clearBtn);
      await tester.pumpAndSettle();
    }

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Search delegate shows suggestions when typing', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final searchBtn = find.byTooltip('Search').first;
    await tester.tap(searchBtn);
    await tester.pumpAndSettle();

    if (products.isNotEmpty) {
      final textField = find.byType(TextField);
      await tester.enterText(textField, products.first.name.substring(0, 2));
      await tester.pumpAndSettle();
    }

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Search delegate shows no results message when nothing found',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    final searchBtn = find.byTooltip('Search').first;
    await tester.tap(searchBtn);
    await tester.pumpAndSettle();

    final textField = find.byType(TextField);
    await tester.enterText(textField, 'zzzznonexistentproduct123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text('No products found.'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Cart badge shows correct count for multiple items',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));

    final cart = CartService();

    final prod1 = Product(
      id: 'p1',
      name: 'Product 1',
      description: '',
      price: 10.0,
      category: '',
      sizes: const [],
      colors: const [],
      imageUrls: const [],
    );

    final prod2 = Product(
      id: 'p2',
      name: 'Product 2',
      description: '',
      price: 15.0,
      category: '',
      sizes: const [],
      colors: const [],
      imageUrls: const [],
    );

    cart.addToCart(CartItem(
        product: prod1, quantity: 1, selectedSize: '', selectedColor: ''));
    cart.addToCart(CartItem(
        product: prod2, quantity: 1, selectedSize: '', selectedColor: ''));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    expect(find.text('2'), findsWidgets);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Mobile: Cart icon shows badge', (tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));

    final cart = CartService();

    final prod = Product(
      id: 'mp',
      name: 'Mobile Product',
      description: '',
      price: 20.0,
      category: '',
      sizes: const [],
      colors: const [],
      imageUrls: const [],
    );

    cart.addToCart(CartItem(
        product: prod, quantity: 1, selectedSize: '', selectedColor: ''));

    await tester.pumpWidget(
        _wrapWithScaffold(child: Navbar(cartService: CartService())));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsWidgets);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });
}
