import 'package:flutter/foundation.dart';
import 'package:nectar_store/Prodect.dart';

class Favouriteprodect extends ChangeNotifier {
  Favouriteprodect._();
  static final Favouriteprodect instance = Favouriteprodect._();

  static List<Product> get favouriteproduct => instance._products;
  final List<Product> _products = [];

  static void toggle(Product product) {
    final index = instance._products.indexWhere(
      (item) => item.imagePath == product.imagePath,
    );

    if (index == -1) {
      instance._products.add(product);
    } else {
      instance._products.removeAt(index);
    }
    instance.notifyListeners();
  }

  static bool isFavourite(Product product) => instance._products.any(
        (item) => item.imagePath == product.imagePath,
      );

  static void remove(Product product) {
    instance._products.removeWhere(
      (item) => item.imagePath == product.imagePath,
    );
    instance.notifyListeners();
  }

  static void clear() {
    instance._products.clear();
    instance.notifyListeners();
  }
}
