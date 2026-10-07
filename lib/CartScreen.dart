import 'package:flutter/material.dart';
import 'package:nectar_store/CartItam.dart';
import 'package:nectar_store/customWidgets/CustomBottomSheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: CartData.instance,
        builder: (context, _) {
          if (CartData.cartItems.isEmpty) {
            return const Center(child: Text('Your Cart is Empty'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: CartData.cartItems.length,
            separatorBuilder: (_, __) => const Divider(height: 30),
            itemBuilder: (context, index) {
              final item = CartData.cartItems[index];
              final product = item.product;
              return Row(
                children: [
                  Image.asset(product.imagePath, width: 70, height: 70, fit: BoxFit.contain),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                            IconButton(
                              onPressed: () => CartData.removeProduct(product),
                              icon: const Icon(Icons.close, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(product.detiles ?? '1kg, Price', style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => CartData.decrease(product),
                                  icon: const Icon(Icons.remove, color: Colors.grey),
                                ),
                                Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                IconButton(
                                  onPressed: () => CartData.increase(product),
                                  icon: const Icon(Icons.add, color: Color(0xFF53B175)),
                                ),
                              ],
                            ),
                            Text(
                              '\$${item.total.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: CartData.instance,
        builder: (context, _) {
          if (CartData.cartItems.isEmpty) return const SizedBox.shrink();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => CustomBottomSheet(totalCost: CartData.totalPrice),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Go to Checkout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                      Text('\$${CartData.totalPrice.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
