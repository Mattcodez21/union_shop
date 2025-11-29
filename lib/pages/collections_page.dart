import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int itemCount;

  const CollectionCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$itemCount items',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  static const List<Map<String, dynamic>> collections = [
    {
      'name': 'Clothing',
      'imageUrl': 'assets/images/clothing_banner.png',
      'itemCount': 24,
    },
    {
      'name': 'Accessories',
      'imageUrl': 'assets/images/accessories_banner.png',
      'itemCount': 18,
    },
    {
      'name': 'Home & Living',
      'imageUrl': 'assets/images/home_living.png',
      'itemCount': 32,
    },
    {
      'name': 'Stationery',
      'imageUrl': 'assets/images/stationary_banner.png',
      'itemCount': 45,
    },
    {
      'name': 'Gifts',
      'imageUrl': 'assets/images/gifts_banner2.png',
      'itemCount': 16,
    },
    {
      'name': 'University Branded',
      'imageUrl': 'assets/images/university_branded.png',
      'itemCount': 28,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      // In your CollectionsPage build method, replace the GridView.builder with:
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine number of columns based on screen width
            int crossAxisCount;
            if (constraints.maxWidth < 600) {
              crossAxisCount = 2; // Mobile: 2 columns
            } else if (constraints.maxWidth < 900) {
              crossAxisCount = 3; // Small desktop: 3 columns
            } else {
              crossAxisCount = 4; // Large desktop: 4 columns
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: collections.length,
              itemBuilder: (context, index) {
                final collection = collections[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to individual collection page
                    Navigator.pushNamed(
                      context,
                      '/collection/${Uri.encodeComponent(collection['name'])}',
                      arguments: collection,
                    );
                  },
                  child: CollectionCard(
                    name: collection['name'],
                    imageUrl: collection['imageUrl'],
                    itemCount: collection['itemCount'],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
