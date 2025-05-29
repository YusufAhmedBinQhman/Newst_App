import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/color.dart';

class ContainerCircleWidget extends StatelessWidget {
  int currentPage, index;
  ContainerCircleWidget({
    super.key,
    required this.currentPage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColor.primarycolor : AppColor.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
