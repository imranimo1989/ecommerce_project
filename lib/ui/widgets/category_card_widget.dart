import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key, required this.categoryName,
  });
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration:
            BoxDecoration(color: primaryColor.withOpacity(.1), borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.computer,size: 28,
                color: primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          categoryName,
          textAlign: TextAlign.center,
          style: const TextStyle(color: primaryColor, fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.6),
        )
      ],
    );
  }
}
