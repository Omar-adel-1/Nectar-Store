class Product {
  final String name;
  final int quantity;
  final double price;
  final String imagePath;
  final String? detiles;
  final String category; 

  Product({
    required this.name,
    required this.quantity,
    required this.price,
    required this.imagePath,
     this.detiles,
    required this.category,
  });
}
