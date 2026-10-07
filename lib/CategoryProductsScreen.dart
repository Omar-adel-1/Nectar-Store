import 'package:flutter/material.dart';
import 'package:nectar_store/AppData.dart';
import 'package:nectar_store/CartItam.dart';
import 'package:nectar_store/Prodect.dart';
import 'package:nectar_store/ProductDetailScreen.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String categoryName;

  const CategoryProductsScreen({Key? key, required this.categoryName})
    : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  
  @override
  Widget build(BuildContext context) {

    final categoryProducts = AppData.allProducts
        .where((product) => product.category == widget.categoryName)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          widget.categoryName,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: categoryProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return buildProductCard(context, categoryProducts[index]);
        },
      ),
    );
  }

  Widget buildProductCard(BuildContext context, Product product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(productDetiles: product),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(product.imagePath, fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: 8),
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${product.quantity}',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  InkWell(
                    onTap: () {
                      final int addedQuantity = 1;

                      int index = CartData.cartItems.indexWhere(
                        (item) => item.product.name == product.name,
                      );

                      setState(() {
                        if (index != -1) {
                          CartData.cartItems[index].quantity += addedQuantity;
                        } else {
                          CartData.cartItems.add(
                            CartItem(product: product, quantity: addedQuantity),
                          );
                        }
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0xFF53B175),
                          content: Text('Added to Basket successfully'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
