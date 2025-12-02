import 'product.dart';

class CartItem {
  final Product product;
  final String selectedSize;
  final String selectedColor;
  int quantity;

  CartItem({
    required this.product,
    required this.selectedSize,
    required this.selectedColor,
    required this.quantity,
  });

  // Factory constructor to create from product state
  factory CartItem.fromProductState({
    required Product product,
    required String selectedSize,
    required String selectedColor,
    required int quantity,
  }) {
    return CartItem(
      product: product,
      selectedSize: selectedSize,
      selectedColor: selectedColor,
      quantity: quantity,
    );
  }
}
