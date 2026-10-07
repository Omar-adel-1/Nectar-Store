import 'package:nectar_store/Prodect.dart';

class ProductModel {
  final String name;
  final String image;
  final String quantity;
  final double price;
  final String category;
  final String brand;

  ProductModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.category,
    required this.brand,
  });

  Product toProduct() {
    return Product(
      name: name,
      quantity: int.tryParse(quantity.split(' ').first) ?? 1,
      price: price,
      imagePath: image,
      detiles: quantity,
      category: category,
    );
  }
}
