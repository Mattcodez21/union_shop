import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:union_shop/data/products_data.dart';
import 'package:union_shop/data/collections_data.dart';

// Product search delegate with product search logic
class ProductSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return const Center(child: Text('No products found.'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        return ListTile(
          leading: product.imageUrls.isNotEmpty
              ? Image.asset(product.imageUrls.first,
                  width: 48, height: 48, fit: BoxFit.cover)
              : const Icon(Icons.shopping_bag),
          title: Text(product.name),
          subtitle: Text(product.description),
          onTap: () {
            close(context, product.name);
            Navigator.pushNamed(context, '/product',
                arguments: {'productId': product.id});
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          title: Text(product.name),
          onTap: () {
            query = product.name;
            showResults(context);
          },
        );
      },
    );
  }
}

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const Navbar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;
        final cartService = CartService();
        final user = FirebaseAuth.instance.currentUser;

        return AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: kToolbarHeight,
          title: isDesktop
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      maxWidth: constraints.maxWidth,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.asset(
                              'assets/images/upsu_logo.png',
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        if (title != null) ...[
                          const SizedBox(width: 24),
                          Text(
                            title!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                        const SizedBox(width: 32),
                        _NavBarButton(
                          label: 'Home',
                          onPressed: () => Navigator.pushNamed(context, '/'),
                        ),
                        const SizedBox(width: 24),
                        PopupMenuButton<String>(
                          offset: const Offset(0, 40),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  disabledForegroundColor: Colors.black87,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 0),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                child: const Text('Shop'),
                              ),
                              const Icon(Icons.arrow_drop_down,
                                  color: Colors.black87, size: 20),
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              collections.map((collection) {
                            return PopupMenuItem<String>(
                              value: collection.id,
                              child: Text(collection.name),
                            );
                          }).toList(),
                          onSelected: (String collectionId) {
                            Navigator.pushNamed(
                              context,
                              '/collection',
                              arguments: {'collectionId': collectionId},
                            );
                          },
                        ),
                        const SizedBox(width: 24),
                        PopupMenuButton<String>(
                          offset: const Offset(0, 40),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  disabledForegroundColor: Colors.black87,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 0),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                child: const Text('The Print Shack'),
                              ),
                              const Icon(Icons.arrow_drop_down,
                                  color: Colors.black87, size: 20),
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'about',
                              child: Text('About'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'personalisation',
                              child: Text('Personalisation'),
                            ),
                          ],
                          onSelected: (String value) {
                            if (value == 'about') {
                              Navigator.pushNamed(
                                  context, '/print-shack-about');
                            } else if (value == 'personalisation') {
                              Navigator.pushNamed(context, '/print-shack');
                            }
                          },
                        ),
                        const SizedBox(width: 24),
                        _NavBarButton(
                          label: 'SALE!',
                          onPressed: () =>
                              Navigator.pushNamed(context, '/sale'),
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 24),
                        _NavBarButton(
                          label: 'About',
                          onPressed: () =>
                              Navigator.pushNamed(context, '/about'),
                        ),
                        const SizedBox(width: 24),
                        const _NavBarButton(
                          label: 'UPSU.net',
                          onPressed: null,
                        ),
                        const SizedBox(width: 24),
                        if (user != null)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              width: 120,
                              child: Text(
                                user.email ?? '',
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black54),
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: ProductSearchDelegate());
                          },
                          tooltip: 'Search',
                        ),
                        IconButton(
                          icon: const Icon(Icons.person_outline,
                              color: Colors.black54),
                          onPressed: () {
                            Navigator.pushNamed(context, '/account');
                          },
                          tooltip: 'Account',
                        ),
                        AnimatedBuilder(
                          animation: cartService,
                          builder: (context, _) {
                            final count = cartService.itemCount;
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.shopping_bag,
                                      color: Colors.black54),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/cart');
                                  },
                                  tooltip: 'Cart',
                                ),
                                if (count > 0)
                                  Positioned(
                                    right: 0,
                                    top: 4,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 20,
                                        minHeight: 20,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '$count',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(width: 60),
                      ],
                    ),
                  ),
                )
              : Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          'assets/images/upsu_logo.png',
                          height: 32,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    if (title != null) ...[
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          title!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ] else
                      const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.black54),
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: ProductSearchDelegate());
                      },
                      tooltip: 'Search',
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outline,
                          color: Colors.black54),
                      onPressed: () {
                        Navigator.pushNamed(context, '/account');
                      },
                      tooltip: 'Account',
                    ),
                    AnimatedBuilder(
                      animation: cartService,
                      builder: (context, _) {
                        final count = cartService.itemCount;
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.shopping_bag,
                                  color: Colors.black54),
                              onPressed: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                              tooltip: 'Cart',
                            ),
                            if (count > 0)
                              Positioned(
                                right: 0,
                                top: 4,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 20,
                                    minHeight: 20,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$count',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
          actions: !isDesktop
              ? [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu,
                          color: Colors.black54, size: 28),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      tooltip: 'Menu',
                    ),
                  ),
                  const SizedBox(width: 8),
                ]
              : null,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavBarButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TextStyle? style;

  const _NavBarButton({
    required this.label,
    this.onPressed,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      child: Text(label, style: style),
    );
  }
}

class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/upsu_logo.png',
                  height: 64,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
                Navigator.of(context).maybePop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.storefront),
              title: const Text('Shop'),
              onTap: () {
                Navigator.pushNamed(context, '/collections');
                Navigator.of(context).maybePop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.print),
              title: const Text('The Print Shack'),
              onTap: () {
                Navigator.pushNamed(context, '/print-shack');
                Navigator.of(context).maybePop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer, color: Colors.red),
              title: const Text(
                'SALE!',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/sale');
                Navigator.of(context).maybePop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
                Navigator.of(context).maybePop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text(
                'UPSU.net',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {},
            ),
            if (user != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  user.email ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            if (user != null)
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Account Manager'),
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                  Navigator.of(context).maybePop();
                },
              ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                showSearch(context: context, delegate: ProductSearchDelegate());
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Cart'),
              onTap: () {
                Navigator.pushNamed(context, '/cart');
                Navigator.of(context).maybePop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
