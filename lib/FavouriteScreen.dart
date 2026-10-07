import 'package:flutter/material.dart';
import 'package:nectar_store/FavouriteProdect.dart';
import 'package:nectar_store/Prodect.dart';
import 'package:nectar_store/ProductDetailScreen.dart';

class FavouriteScreen extends StatefulWidget {
   const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      
      appBar: AppBar(
        title:  Text(
          'Favorurite',
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
       
        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
      ),

     
      body: Favouriteprodect.favouriteproduct.isEmpty
          ?  Center(child: Text('No favorite products found'))
          : ListView.separated(
        itemCount: Favouriteprodect.favouriteproduct.length, 
        
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.shade300,
          thickness: 1,
          indent: 20, 
          endIndent: 20, 
        ),
        itemBuilder: (context, index) {
          
          final Product product = Favouriteprodect.favouriteproduct[index];
          
          return ListTile(
            contentPadding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            
            leading: Image.asset(
              product.imagePath, 
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            
            
            title: Text(
              product.name,
              style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            
           
            subtitle: Text(
              product.detiles ?? 'No details available', 
              style:  TextStyle(color: Colors.grey, fontSize: 14),
            ),
            
            
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                 SizedBox(width: 10),
                 Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
              ],
            ),
            onTap: () {
             Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(productDetiles: product),
            ),
          );
            },
          );
        },
      ),

     
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFF53B175), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              onPressed: () {
                // حدث إضافة المنتجات للسلة
              },
              child:  Text(
                'Add All To Cart',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}