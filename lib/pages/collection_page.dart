import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  final String collectionName;
  final Map<String, dynamic>? collectionData;

  const CollectionPage({
    super.key,
    required this.collectionName,
    this.collectionData,
  });

  String getCollectionDescription(String collectionName) {
    switch (collectionName.toLowerCase()) {
      case 'clothing':
        return 'Discover our premium clothing collection featuring comfortable and stylish apparel for every occasion.';
      case 'accessories':
        return 'Complete your look with our carefully curated selection of accessories and lifestyle products.';
      case 'home & living':
      case 'home living':
        return 'Transform your living space with our modern and functional home decor items.';
      case 'stationery':
        return 'Essential stationery items for work, study, and creative projects.';
      case 'gifts':
        return 'Perfect gifts for your loved ones, carefully selected for special occasions.';
      case 'university branded':
        return 'Show your university pride with our exclusive branded merchandise and apparel.';
      default:
        return 'Explore our ${collectionName.toLowerCase()} collection with high-quality products at great prices.';
    }
  }

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
      body: Column(
        children: [
          // Collection Header Section
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  collectionName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  getCollectionDescription(collectionName),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  collection != null
                      ? '${collection['itemCount']} products'
                      : '10 products',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Filter and Sort Dropdowns Row
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Row(
              children: [
                // Filter By Dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'FILTER BY',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    value: 'All Items',
                    items: const [
                      DropdownMenuItem(
                          value: 'All Items', child: Text('All Items')),
                      DropdownMenuItem(value: 'Size', child: Text('Size')),
                      DropdownMenuItem(value: 'Color', child: Text('Color')),
                      DropdownMenuItem(
                          value: 'Price Range', child: Text('Price Range')),
                      DropdownMenuItem(value: 'Brand', child: Text('Brand')),
                    ],
                    onChanged: (value) {
                      // Non-functional dropdown for now
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Sort By Dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'SORT BY',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    value: 'Featured',
                    items: const [
                      DropdownMenuItem(
                          value: 'Featured', child: Text('Featured')),
                      DropdownMenuItem(
                          value: 'Price: Low to High',
                          child: Text('Price: Low to High')),
                      DropdownMenuItem(
                          value: 'Price: High to Low',
                          child: Text('Price: High to Low')),
                      DropdownMenuItem(
                          value: 'Name: A to Z', child: Text('Name: A to Z')),
                      DropdownMenuItem(
                          value: 'Name: Z to A', child: Text('Name: Z to A')),
                      DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                    ],
                    onChanged: (value) {
                      // Non-functional dropdown for now
                    },
                  ),
                ),
              ],
            ),
          ),

          // Products will be displayed here section
          const Expanded(
            child: Center(
              child: Text(
                'Collection products will be displayed here',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
