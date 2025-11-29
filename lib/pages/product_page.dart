import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'PLACEHOLDER HEADER TEXT',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.asset(
                              'assets/images/upsu_logo.png',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

// Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 600;

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
                                      color:
                                          Colors.black.withValues(alpha: 0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/signature_hoodie.png',
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
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    final thumbnailImages = [
                                      'assets/images/signature_hoodie.png',
                                      'assets/images/signature_hoodie.png',
                                      'assets/images/signature_hoodie.png',
                                      'assets/images/signature_hoodie.png',
                                    ];

                                    return GestureDetector(
                                      onTap: () {
                                        placeholderCallbackForButtons();
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        margin: EdgeInsets.only(
                                          right: index < 3 ? 16 : 0,
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
                                                            .withValues(
                                                                alpha: 0.2),
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
                                            thumbnailImages[index],
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
                              const Text(
                                'Signature Hoodie',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                '£15.00',
                                style: TextStyle(
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
                                            value: 'Black',
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            items: [
                                              'Black',
                                              'Purple',
                                              'Green',
                                              'Grey'
                                            ].map((String color) {
                                              return DropdownMenuItem<String>(
                                                value: color,
                                                child: Text(color),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              placeholderCallbackForButtons();
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
                                            value: 'M',
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            items: ['S', 'M', 'L', 'XL']
                                                .map((String size) {
                                              return DropdownMenuItem<String>(
                                                value: size,
                                                child: Text(size),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              placeholderCallbackForButtons();
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
                                            value: 1,
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
                                              placeholderCallbackForButtons();
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
                              const Text(
                                'Bringing to you, our best selling signature hoodie! Perfect for showing your university pride and staying comfortable during those long study sessions.',
                                style: TextStyle(
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
                              const Text(
                                'Soft, comfortable, 50% cotton blend material. High-quality print that won\'t fade. Durable construction built to last. Available in multiple colors and sizes to suit your style.',
                                style: TextStyle(
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
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/signature_hoodie.png',
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
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  final thumbnailImages = [
                                    'assets/images/signature_hoodie.png',
                                    'assets/images/signature_hoodie.png',
                                    'assets/images/signature_hoodie.png',
                                    'assets/images/signature_hoodie.png',
                                  ];

                                  return GestureDetector(
                                    onTap: () {
                                      placeholderCallbackForButtons();
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      margin: EdgeInsets.only(
                                        right: index < 3 ? 12 : 0,
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
                                                      .withValues(alpha: 0.2),
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          thumbnailImages[index],
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
                        const Text(
                          'Signature Hoodie',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '£15.00',
                          style: TextStyle(
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
                                          value: 'Black',
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items: [
                                            'Black',
                                            'Purple',
                                            'Green',
                                            'Grey'
                                          ].map((String color) {
                                            return DropdownMenuItem<String>(
                                              value: color,
                                              child: Text(color),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            placeholderCallbackForButtons();
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
                                          value: 'M',
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items: ['S', 'M', 'L', 'XL']
                                              .map((String size) {
                                            return DropdownMenuItem<String>(
                                              value: size,
                                              child: Text(size),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            placeholderCallbackForButtons();
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
                                          value: 1,
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
                                            placeholderCallbackForButtons();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                    child: SizedBox()), // Empty space
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Add to Cart button (mobile) - same styling as desktop
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

                        // Buy with Shop Pay button (mobile) - same styling as desktop
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
                        const Text(
                          'Bringing to you, our best selling signature hoodie! Perfect for showing your university pride and staying comfortable during those long study sessions.',
                          style: TextStyle(
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
                        const Text(
                          'Soft, comfortable, 50% cotton blend material. High-quality print that won\'t fade. Durable construction built to last. Available in multiple colors and sizes to suit your style.',
                          style: TextStyle(
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
