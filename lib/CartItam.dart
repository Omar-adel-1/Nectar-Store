import 'package:flutter/foundation.dart';
import 'package:nectar_store/Prodect.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  double get total => product.price * quantity;
}

class CartData extends ChangeNotifier {
  CartData._();
  static final CartData instance = CartData._();

  static List<CartItem> get cartItems => instance._items;
  final List<CartItem> _items = [];

  static void addProduct(Product product, {int quantity = 1}) {
    final index = instance._items.indexWhere(
      (item) => item.product.imagePath == product.imagePath,
    );
    if (index == -1) {
      instance._items.add(CartItem(product: product, quantity: quantity));
    } else {
      instance._items[index].quantity += quantity;
    }
    instance.notifyListeners();
  }

  static void removeProduct(Product product) {
    instance._items.removeWhere(
      (item) => item.product.imagePath == product.imagePath,
    );
    instance.notifyListeners();
  }

  static void increase(Product product) {
    final index = instance._items.indexWhere(
      (item) => item.product.imagePath == product.imagePath,
    );
    if (index != -1) {
      instance._items[index].quantity++;
      instance.notifyListeners();
    }
  }

  static void decrease(Product product) {
    final index = instance._items.indexWhere(
      (item) => item.product.imagePath == product.imagePath,
    );
    if (index != -1) {
      if (instance._items[index].quantity > 1) {
        instance._items[index].quantity--;
      } else {
        instance._items.removeAt(index);
      }
      instance.notifyListeners();
    }
  }

  static double get totalPrice => instance._items.fold(
        0,
        (total, item) => total + item.total,
      );

  static int get totalItems => instance._items.fold(
        0,
        (total, item) => total + item.quantity,
      );

  static bool contains(Product product) => instance._items.any(
        (item) => item.product.imagePath == product.imagePath,
      );

  static List<CartItem> snapshot() => instance._items
      .map((item) => CartItem(product: item.product, quantity: item.quantity))
      .toList();

  static void clear() {
    instance._items.clear();
    instance.notifyListeners();
  }
}
