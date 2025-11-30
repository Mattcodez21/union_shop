import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          // Bigger UPSU logo on the left
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Image.asset(
                'assets/images/upsu_logo.png',
                height: 150, // Increased logo size
                fit: BoxFit.contain,
              ),
            ),
          ),
          if (isDesktop) ...[
            const SizedBox(width: 32),
            // Navigation buttons with more spacing
            _NavBarButton(
              label: 'Home',
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            const SizedBox(width: 24),
            _NavBarButton(
              label: 'Shop',
              onPressed: () => Navigator.pushNamed(context, '/collections'),
            ),
            const SizedBox(width: 24),
            const _NavBarButton(
              label: 'The Print Shack',
              onPressed: null, // Not functional
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 24),
            _NavBarButton(
              label: 'SALE!',
              onPressed: () => Navigator.pushNamed(context, '/sale'),
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 24),
            _NavBarButton(
              label: 'About',
              onPressed: () => Navigator.pushNamed(context, '/about'),
            ),
            const SizedBox(width: 24),
            const _NavBarButton(
              label: 'UPSU.net',
              onPressed: null, // External link, not functional here
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
          // Spacer to push icons to the right
          const Spacer(),
          // Header icons on the far right
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black54),
                onPressed: () {},
                tooltip: 'Search',
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.black54),
                onPressed: () {},
                tooltip: 'Account',
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined,
                    color: Colors.black54),
                onPressed: () {},
                tooltip: 'Cart',
              ),
            ],
          ),
          const SizedBox(width: 24),
        ],
      ),
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
