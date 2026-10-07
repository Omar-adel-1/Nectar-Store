import 'package:flutter/material.dart';
import 'package:nectar_store/CategoryProductsScreen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Fresh Fruits',
        'color':  Color(0xFFE8F5E9),
        'borderColor':  Color(0xFFC8E6C9),
        'image': 'assets/images/freshfruit.png',
      },
      {
        'title': 'Vegetables',
        'color':  Color(0xFFFFF3E0),
        'borderColor':  Color(0xFFFFE0B2),
        'image': 'assets/images/Vegetables.png',
      },
      {
        'title': 'Meat & Fish',
        'color':  Color(0xFFFFEBEE),
        'borderColor':  Color(0xFFFFCDD2),
        'image': 'assets/images/Meat&fFish.png',
      },
      {
        'title': 'Bakery & Snacks',
        'color':  Color(0xFFF3E5F5),
        'borderColor':  Color(0xFFE1BEE7),
        'image': 'assets/images/Bakery&Snacks.png',
      },
      {
        'title': 'Drinks',
        'color':  Color(0xFFE3F2FD),
        'borderColor':  Color(0xFFBBDEFB),
        'image': 'assets/images/Drinks.png',
      },
      {
        'title': 'Packaged Goods',
        'color':  Color(0xFFFFF8E1),
        'borderColor':  Color(0xFFFFECB3),
        'image': 'assets/images/packagedGoods.png', 
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: 20),
               Text(
                'Find Products',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
               SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Store',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
               SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  physics:  BouncingScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio:
                        0.8, 
                  ),
                  itemBuilder: (context, index) {
                    return _buildCategoryCard(
                      title: categories[index]['title'],
                      bgColor: categories[index]['color'],
                      borderColor: categories[index]['borderColor'],
                      imagePath: categories[index]['image'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProductsScreen(
                              categoryName: categories[index]['title'],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required Color bgColor,
    required Color borderColor,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding:  EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             
                Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
                 SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
