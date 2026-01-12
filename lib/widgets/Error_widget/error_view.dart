import 'package:flutter/material.dart';
import 'package:nesa_machine_test/widgets/product_detail/app_button.dart';

import '../../config/theme/app_colors.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.red,
          ),
          const SizedBox(height: 16),
          const Text(
            "Something went wrong!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          AppButton(
            width: 100,
            height: 40,
            onTap: onTap,
            text: "Retry",
          ),
        ],
      ),
    );
  }
}
