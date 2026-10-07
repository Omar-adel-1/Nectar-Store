import 'package:nectar_store/Prodect.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartData {
  static List<CartItem> cartItems = [];
}