import 'package:flutter/material.dart';
import 'package:nectar_store/CartItam.dart';
import 'package:nectar_store/Prodect.dart';
import 'package:nectar_store/ProductDetailScreen.dart';

final PageController _bannerPageController = PageController();
int _currentBannerIndex = 0;

final List<Map<String, String>> banners = [
  {'bgImage': 'assets/images/banner.png'},
  {
    'bgImage': 'https://img.freepik.com/free-vector/soft-yellow-abstract-background_1048-12886.jpg',
    'sideImage': 'https://cdn-icons-png.flaticon.com/512/3194/3194766.png',
  },
  {
    'bgImage': 'https://img.freepik.com/free-vector/soft-blue-abstract-background_1048-12887.jpg',
    'sideImage': 'https://cdn-icons-png.flaticon.com/512/2909/2909808.png',
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(
      name: 'Red Apple',
      quantity: 1,
      price: 4.99,
      imagePath: 'assets/images/Apple.png',
    ),
    Product(
      name: 'Organic Bananas',
      quantity: 7,
      price: 4.99,
      imagePath: 'https://cdn-icons-png.flaticon.com/512/2909/2909808.png',
    ),

    Product(
      name: 'Bell Pepper Red',
      quantity: 1,
      price: 4.99,
      imagePath: 'https://cdn-icons-png.flaticon.com/512/765/765544.png',
    ),
    Product(
      name: 'Ginger',
      quantity: 1,
      price: 2.99,
      imagePath: 'https://cdn-icons-png.flaticon.com/512/1135/1135241.png',
    ),
    Product(
      name: 'Beef Bone',
      quantity: 1,
      price: 8.99,
      imagePath: 'https://cdn-icons-png.flaticon.com/512/3143/3143643.png',
    ),
    Product(
      name: 'Broiler Chicken',
      quantity: 1,
      price: 5.99,
      imagePath: 'https://cdn-icons-png.flaticon.com/512/1046/1046751.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Icon + Location
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/images/Group-1.png'),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 4),
                        InkWell(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Assuit, Assuit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search Store',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 145,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        controller: _bannerPageController,
                        itemCount: banners.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentBannerIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final banner = banners[index];
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(banner['bgImage']!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),

                      Positioned(
                        bottom: 10,
                        child: Row(
                          children: List.generate(banners.length, (index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              width: _currentBannerIndex == index ? 20 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentBannerIndex == index
                                    ? Colors.green
                                    : Colors.grey.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive Offer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // عند الضغط على See All يتم الانتقال لشاشة عرض كل المنتجات بالشبكة
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SeeAllProductsScreen(products: products),
                      //   ),
                      // );
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return buildProductCard(context, products[index]);
                },
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
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
                  // 3. زر (+) قابل للنقر للانتقال لشاشة أخرى
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
