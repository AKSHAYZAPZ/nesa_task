import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesa_machine_test/config/theme/app_colors.dart';
import '../../controllers/product_detail_controller.dart';

class ProductDetailTabSwitcher extends StatelessWidget {
  const ProductDetailTabSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailsController>();

    Widget tab({
      required String title,
      required bool isSelected,
      required VoidCallback onTap,
    }) {
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blueLite : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return Obx(
      () => Row(
        children: [
          tab(
            title: 'Full Specification',
            isSelected: controller.selectedTab.value == 0,
            onTap: () => controller.changeTab(0),
          ),
          const SizedBox(width: 12),
          tab(
            title: 'Reviews',
            isSelected: controller.selectedTab.value == 1,
            onTap: () => controller.changeTab(1),
          ),
        ],
      ),
    );
  }
}
