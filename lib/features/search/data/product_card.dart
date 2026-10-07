import 'package:flutter/material.dart';
import 'package:nectar_store/features/search/models/product_model.dart';
import 'package:nectar_store/CartItam.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Center(
              child: Image.asset(product.image, fit: BoxFit.contain),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 4),

          Text(
            product.quantity,

            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',

                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              InkWell(
                onTap: () {
                  CartData.addProduct(product.toProduct());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to Basket successfully'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFF53B175),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
