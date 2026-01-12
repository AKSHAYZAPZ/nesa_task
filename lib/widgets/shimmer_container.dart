import 'package:flutter/material.dart';
import 'package:nesa_machine_test/config/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {super.key,
        required this.width,
        required this.height,
        required this.borderRadius});
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      period: const Duration(milliseconds: 500),
      direction: ShimmerDirection.ltr,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}