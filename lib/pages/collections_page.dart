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
      body: const Center(
        child: Text(
          'Collections Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
