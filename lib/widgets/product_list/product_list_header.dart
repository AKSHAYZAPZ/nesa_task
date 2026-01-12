import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

class ProductListHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProductListHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              'Show All',
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
