import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/data/products_data.dart';
import 'package:union_shop/models/product.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? selectedSize;
  String? selectedColor;
  int quantity = 1;
  Product? product;

  @override
  void initState() {
    super.initState();
    product = getProductById(widget.productId);
    if (product != null) {
      selectedColor = product!.colors.isNotEmpty ? product!.colors.first : null;
      selectedSize = product!.sizes.isNotEmpty ? product!.sizes.first : null;
      quantity = 1;
    }
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    // Use the product loaded in initState
    if (product == null) {
      // Show error message and redirect after a short delay
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }
        }
      });

      return Scaffold(
        appBar: const Navbar(),
        endDrawer: const MobileNavDrawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 64),
                const SizedBox(height: 16),
                Text(
                  'Sorry, this product could not be found.\nYou will be redirected shortly.',
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => navigateToHome(context),
                  icon: const Icon(Icons.home),
                  label: const Text('Go to Home'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const Navbar(),
      endDrawer: const MobileNavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: const Color(0xFF4d2963),
              child: Text(
                product!.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            // ...rest of your product details code...
            // (unchanged from previous version)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 600;

                  // Use product fields instead of hardcoded values
                  final mainImage = product!.imageUrls.isNotEmpty
                      ? product!.imageUrls.first
                      : '';
                  final thumbnails = product!.imageUrls.isNotEmpty
                      ? product!.imageUrls
                      : [
                          'assets/images/signature_hoodie.png',
                          'assets/images/signature_hoodie.png',
                          'assets/images/signature_hoodie.png',
                          'assets/images/signature_hoodie.png',
                        ];

                  if (isDesktop) {
                    // Desktop: Two-column layout
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side: Product images
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              // Main large product image
                              Container(
                                height: 500,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey[100],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(25),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    mainImage,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.image_not_supported,
                                                size: 64,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Image unavailable',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Image carousel thumbnails
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: thumbnails.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        placeholderCallbackForButtons();
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        margin: EdgeInsets.only(
                                          right: index < thumbnails.length - 1
                                              ? 16
                                              : 0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: index == 0
                                                ? const Color(0xFF4d2963)
                                                : Colors.grey[300]!,
                                            width: 2,
                                          ),
                                          boxShadow: index == 0
                                              ? [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xFF4d2963)
                                                            .withAlpha(50),
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 2),
                                                  ),
                                                ]
                                              : null,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            thumbnails[index],
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                color: Colors.grey[200],
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.image_not_supported,
                                                    size: 24,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 48),
                        // Right side: Product info
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product!.name,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '£${product!.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4d2963),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Tax included',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 32),
                              // Product options row
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Color',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[300]!),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: DropdownButton<String>(
                                            value: selectedColor,
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            items: product!.colors
                                                .map((String color) {
                                              return DropdownMenuItem<String>(
                                                value: color,
                                                child: Text(color),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedColor = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Size',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[300]!),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: DropdownButton<String>(
                                            value: selectedSize,
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            items: product!.sizes
                                                .map((String size) {
                                              return DropdownMenuItem<String>(
                                                value: size,
                                                child: Text(size),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedSize = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Quantity',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey[300]!),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: DropdownButton<int>(
                                            value: quantity,
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            items: List<
                                                DropdownMenuItem<int>>.generate(
                                              10,
                                              (index) => DropdownMenuItem<int>(
                                                value: index + 1,
                                                child: Text('${index + 1}'),
                                              ),
                                            ),
                                            onChanged: (int? newValue) {
                                              setState(() {
                                                quantity = newValue ?? 1;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              // Add to Cart button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: placeholderCallbackForButtons,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4d2963),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    'ADD TO CART',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Buy with Shop Pay button
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: placeholderCallbackForButtons,
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    side: BorderSide(
                                        color: Colors.grey[400]!, width: 1.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Buy with Shop Pay',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                product!.description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Product Details',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // You can add more product details here if available
                              Text(
                                'Category: ${product!.category}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 32),
                              // Social share buttons
                              Wrap(
                                spacing: 12,
                                children: [
                                  OutlinedButton.icon(
                                    onPressed: placeholderCallbackForButtons,
                                    icon: const Icon(Icons.share, size: 18),
                                    label: const Text('SHARE'),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      side:
                                          BorderSide(color: Colors.grey[300]!),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                  OutlinedButton.icon(
                                    onPressed: placeholderCallbackForButtons,
                                    icon: const Icon(Icons.link, size: 18),
                                    label: const Text('TWEET'),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      side:
                                          BorderSide(color: Colors.grey[300]!),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                  OutlinedButton.icon(
                                    onPressed: placeholderCallbackForButtons,
                                    icon: const Icon(Icons.push_pin, size: 18),
                                    label: const Text('PIN IT'),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      side:
                                          BorderSide(color: Colors.grey[300]!),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Mobile: Keep existing column layout
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image with carousel thumbnails
                        Column(
                          children: [
                            // Main large product image
                            Container(
                              height: 350,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[100],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  mainImage,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[200],
                                      child: const Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.image_not_supported,
                                              size: 64,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Image unavailable',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Image carousel thumbnails
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: thumbnails.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      placeholderCallbackForButtons();
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      margin: EdgeInsets.only(
                                        right: index < thumbnails.length - 1
                                            ? 12
                                            : 0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: index == 0
                                              ? const Color(0xFF4d2963)
                                              : Colors.grey[300]!,
                                          width: 2,
                                        ),
                                        boxShadow: index == 0
                                            ? [
                                                BoxShadow(
                                                  color: const Color(0xFF4d2963)
                                                      .withAlpha(50),
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          thumbnails[index],
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child: Icon(
                                                  Icons.image_not_supported,
                                                  size: 24,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Product info (mobile)
                        Text(
                          product!.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '£${product!.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4d2963),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Tax included',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Product options (mobile)
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Color',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[300]!),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: DropdownButton<String>(
                                          value: selectedColor,
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items: product!.colors
                                              .map((String color) {
                                            return DropdownMenuItem<String>(
                                              value: color,
                                              child: Text(color),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedColor = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Size',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[300]!),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: DropdownButton<String>(
                                          value: selectedSize,
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items:
                                              product!.sizes.map((String size) {
                                            return DropdownMenuItem<String>(
                                              value: size,
                                              child: Text(size),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedSize = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Quantity',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[300]!),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: DropdownButton<int>(
                                          value: quantity,
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items: List<
                                              DropdownMenuItem<int>>.generate(
                                            10,
                                            (index) => DropdownMenuItem<int>(
                                              value: index + 1,
                                              child: Text('${index + 1}'),
                                            ),
                                          ),
                                          onChanged: (int? newValue) {
                                            setState(() {
                                              quantity = newValue ?? 1;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(child: SizedBox()),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Add to Cart button (mobile)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: placeholderCallbackForButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              'ADD TO CART',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Buy with Shop Pay button (mobile)
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: placeholderCallbackForButtons,
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              side: BorderSide(
                                  color: Colors.grey[400]!, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Buy with Shop Pay',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product!.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Product Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Category: ${product!.category}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Social share buttons (mobile)
                        Row(
                          children: [
                            OutlinedButton.icon(
                              onPressed: placeholderCallbackForButtons,
                              icon: const Icon(Icons.share, size: 16),
                              label: const Text('SHARE'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                side: BorderSide(color: Colors.grey[400]!),
                              ),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton.icon(
                              onPressed: placeholderCallbackForButtons,
                              icon: const Icon(Icons.link, size: 16),
                              label: const Text('TWEET'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                side: BorderSide(color: Colors.grey[400]!),
                              ),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton.icon(
                              onPressed: placeholderCallbackForButtons,
                              icon: const Icon(Icons.push_pin, size: 16),
                              label: const Text('PIN IT'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                side: BorderSide(color: Colors.grey[400]!),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    );
                  }
                },
              ),
            ),
            // Back to collection button
            Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text('BACK TO COLLECTION'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Colors.grey[400]!, width: 1.5),
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: const Text(
                'Placeholder Footer',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
