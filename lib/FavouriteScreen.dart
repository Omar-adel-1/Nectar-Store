import 'package:flutter/material.dart';
import 'package:nectar_store/FavouriteProdect.dart';
import 'package:nectar_store/CartItam.dart';
import 'package:nectar_store/ProductDetailScreen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Favourite', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: Favouriteprodect.instance,
        builder: (context, _) {
          final products = Favouriteprodect.favouriteproduct;
          if (products.isEmpty) {
            return const Center(child: Text('No favorite products found'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: products.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(product.imagePath, width: 55, height: 55, fit: BoxFit.contain),
                title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(product.detiles ?? 'No details available'),
                trailing: IconButton(
                  onPressed: () => Favouriteprodect.remove(product),
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetailScreen(productDetiles: product)),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: Favouriteprodect.instance,
        builder: (context, _) {
          if (Favouriteprodect.favouriteproduct.isEmpty) return const SizedBox.shrink();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    for (final product in Favouriteprodect.favouriteproduct) {
                      CartData.addProduct(product);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All favourite products added to cart')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text('Add All To Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
