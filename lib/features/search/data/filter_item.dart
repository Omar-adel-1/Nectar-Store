import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const FilterItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF53B175) : Colors.transparent,
                border: Border.all(
                  color: selected ? const Color(0xFF53B175) : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: selected
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null,
            ),

            const SizedBox(width: 8),

            Text(
              title,
              style: TextStyle(
                color: selected ? const Color(0xFF53B175) : Colors.black87,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
