import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  final String collectionName;
  final Map<String, dynamic>? collectionData;

  const CollectionPage({
    super.key,
    required this.collectionName,
    this.collectionData,
  });

  @override
  Widget build(BuildContext context) {
    // Extract collection data from route arguments if not provided directly
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final collection = collectionData ?? routeArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              collectionName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (collection != null) ...[
              Text(
                'Items: ${collection['itemCount']}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Image: ${collection['imageUrl']}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
            const SizedBox(height: 24),
            const Text(
              'Collection products will be displayed here',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
