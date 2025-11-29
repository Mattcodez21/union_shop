import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  static const List<Map<String, String>> collections = [
    {
      'name': 'Clothing',
      'imageUrl':
          'https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=Clothing'
    },
    {
      'name': 'Accessories',
      'imageUrl':
          'https://via.placeholder.com/300x200/4ECDC4/FFFFFF?text=Accessories'
    },
    {
      'name': 'Home & Living',
      'imageUrl':
          'https://via.placeholder.com/300x200/45B7D1/FFFFFF?text=Home+Living'
    },
    {
      'name': 'Stationery',
      'imageUrl':
          'https://via.placeholder.com/300x200/96CEB4/FFFFFF?text=Stationery'
    },
    {
      'name': 'Gifts',
      'imageUrl': 'https://via.placeholder.com/300x200/FFEAA7/000000?text=Gifts'
    },
    {
      'name': 'University Branded',
      'imageUrl':
          'https://via.placeholder.com/300x200/DDA0DD/000000?text=University+Branded'
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns on mobile
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8, // Adjust height ratio
          ),
          itemCount: collections.length,
          itemBuilder: (context, index) {
            final collection = collections[index];
            return Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      collection['imageUrl']!,
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
                    child: Text(
                      collection['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
