import 'package:flutter/material.dart';
import 'package:nectar_store/features/search/data/filter_item.dart';

class FilterScreen extends StatefulWidget {
  final List<String> selectedCategories;
  final List<String> selectedBrands;

  const FilterScreen({
    super.key,
    this.selectedCategories = const [],
    this.selectedBrands = const [],
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late List<String> selectedCategories;
  late List<String> selectedBrands;

  final List<String> categories = [
    'Eggs',
    'Noodles & Pasta',
    'Chips & Crisps',
    'Fast Food',
  ];

  final List<String> brands = [
    'Individual Collection',
    'Cocola',
    'Ifad',
    'Kazi Farms',
  ];

  @override
  void initState() {
    super.initState();

    selectedCategories = List.from(widget.selectedCategories);
    selectedBrands = List.from(widget.selectedBrands);
  }

  void _toggleCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  void _toggleBrand(String brand) {
    setState(() {
      if (selectedBrands.contains(brand)) {
        selectedBrands.remove(brand);
      } else {
        selectedBrands.add(brand);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, color: Colors.black),
        ),
        title: const Text(
          'Filters',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xFFF1F2F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  ...categories.map((category) {
                    return FilterItem(
                      title: category,
                      selected: selectedCategories.contains(category),
                      onTap: () {
                        _toggleCategory(category);
                      },
                    );
                  }),

                  const SizedBox(height: 25),

                  const Text(
                    'Brand',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  ...brands.map((brand) {
                    return FilterItem(
                      title: brand,
                      selected: selectedBrands.contains(brand),
                      onTap: () {
                        _toggleBrand(brand);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),

          Container(
            color: const Color(0xFFF7F7F7),
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 25),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'categories': selectedCategories,
                    'brands': selectedBrands,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Apply Filter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
