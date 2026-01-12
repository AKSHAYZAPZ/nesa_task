import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';
import '../../models/product_detail_model.dart';

class SpecificationTab extends StatelessWidget {
  final ProductDetail product;
  const SpecificationTab({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        specRow('Category', product.category),
        const SizedBox(height: 6),
        specRow('Rating', product.rating.toString()),
        const SizedBox(height: 6),
        specRow('Stock', product.stock.toString()),
      ],
    );
  }

  Widget specRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: AppColors.grey)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
