import 'package:flutter/material.dart';
import 'package:nectar_store/features/search/data/product_card.dart';

import '../data/products.dart';
import '../models/product_model.dart';
import 'filter_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<ProductModel> filteredProducts = products;

  List<String> selectedCategories = [];
  List<String> selectedBrands = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_applyFilters);
  }

  void _applyFilters() {
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      filteredProducts = products.where((product) {
        final matchesSearch =
            query.isEmpty || product.name.toLowerCase().contains(query);

        final matchesCategory =
            selectedCategories.isEmpty ||
            selectedCategories.contains(product.category);

        final matchesBrand =
            selectedBrands.isEmpty || selectedBrands.contains(product.brand);

        return matchesSearch && matchesCategory && matchesBrand;
      }).toList();
    });
  }

  Future<void> _openFilter() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(
          selectedCategories: selectedCategories,
          selectedBrands: selectedBrands,
        ),
      ),
    );

    if (result != null) {
      selectedCategories = List<String>.from(result['categories']);

      selectedBrands = List<String>.from(result['brands']);

      _applyFilters();
    }
  }

  void _clearSearch() {
    _searchController.clear();
  }

  @override
  void dispose() {
    _searchController.removeListener(_applyFilters);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),

        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            children: [
              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,

                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: TextField(
                        controller: _searchController,

                        decoration: InputDecoration(
                          hintText: 'Search',

                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),

                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: _clearSearch,
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.grey,
                                  ),
                                )
                              : null,

                          border: InputBorder.none,

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    height: 52,
                    width: 52,

                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: IconButton(
                      onPressed: _openFilter,

                      icon: const Icon(Icons.tune, color: Colors.black),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: filteredProducts.isEmpty
                    ? const Center(
                        child: Text(
                          'No products found',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20),

                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.72,
                            ),

                        itemCount: filteredProducts.length,

                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];

                          return ProductCard(product: product);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
