import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String nameCategory;
  bool isSelected = false;
  VoidCallback myOnTap;
  CategoryWidget({
    super.key,
    required this.nameCategory,
    required this.isSelected,
    required this.myOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: myOnTap,
      child: Column(
        spacing: 5,
        children: [
          Text(
            "${nameCategory}",
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.black,
              fontSize: 18,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
          if (isSelected) Container(height: 2, width: 70, color: Colors.red),
        ],
      ),
    );
  }
}
