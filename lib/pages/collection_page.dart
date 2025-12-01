import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/data/products_data.dart';
import 'package:union_shop/models/product.dart';

class CollectionPage extends StatefulWidget {
  final String collectionName;
  final Map<String, dynamic>? collectionData;

  const CollectionPage({
    super.key,
    required this.collectionName,
    this.collectionData,
  });

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String selectedSort = 'Featured';
  String selectedSize = 'All';
  String selectedColor = 'All';

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

  List<Product> filterProducts(List<Product> products) {
    return products.where((product) {
      final matchesCategory =
          product.category.toLowerCase() == widget.collectionName.toLowerCase();
      final matchesSize =
          selectedSize == 'All' || product.sizes.contains(selectedSize);
      final matchesColor =
          selectedColor == 'All' || product.colors.contains(selectedColor);
      return matchesCategory && matchesSize && matchesColor;
    }).toList();
  }

  List<Product> sortProducts(List<Product> products) {
    switch (selectedSort) {
      case 'Price: Low to High':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Name: A to Z':
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Name: Z to A':
        products.sort((a, b) => b.name.compareTo(a.name));
        break;
      // 'Featured' and 'Newest' can just use the default order for now
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    // Gather all unique sizes and colors for dropdowns
    final allSizes = <String>{};
    final allColors = <String>{};
    for (final product in products.where((p) =>
        p.category.toLowerCase() == widget.collectionName.toLowerCase())) {
      allSizes.addAll(product.sizes);
      allColors.addAll(product.colors);
    }
    final sizeOptions = ['All', ...allSizes.where((s) => s.isNotEmpty)];
    final colorOptions = ['All', ...allColors.where((c) => c.isNotEmpty)];

    // Filter and sort products
    List<Product> filteredProducts = filterProducts(products);
    filteredProducts = sortProducts(filteredProducts);

    return Scaffold(
      appBar: const Navbar(),
      endDrawer: const MobileNavDrawer(),
      body: Column(
        children: [
          // Collection Header Section
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  widget.collectionName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  getCollectionDescription(widget.collectionName),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  '${filteredProducts.length} product${filteredProducts.length == 1 ? '' : 's'}',
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
                // Size Filter Dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'SIZE',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    initialValue: selectedSize,
                    items: sizeOptions
                        .map((size) =>
                            DropdownMenuItem(value: size, child: Text(size)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value ?? 'All';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Color Filter Dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'COLOR',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    initialValue: selectedColor,
                    items: colorOptions
                        .map((color) =>
                            DropdownMenuItem(value: color, child: Text(color)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedColor = value ?? 'All';
                      });
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
                    initialValue: selectedSort,
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
                      setState(() {
                        selectedSort = value ?? 'Featured';
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Products Grid Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Products:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount;
                        if (constraints.maxWidth < 600) {
                          crossAxisCount = 2;
                        } else {
                          crossAxisCount = 3;
                        }

                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return ProductCard(
                              name: product.name,
                              price: product.price,
                              imageUrl: product.imageUrls.isNotEmpty
                                  ? product.imageUrls.first
                                  : '',
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: {
            'name': name,
            'price': price,
            'imageUrl': imageUrl,
          },
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: imageUrl.isNotEmpty
                  ? Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.shopping_bag,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.shopping_bag,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '£${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
