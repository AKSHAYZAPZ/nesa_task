import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/theme/app_colors.dart';
import '../../controllers/cart_controller.dart';
import '../../config/routes/app_routes.dart';

class CartIconBadge extends StatelessWidget {
  final double iconSize;
  final Color iconColor;
  final Color badgeColor;

  const CartIconBadge({
    super.key,
    this.iconSize = 24,
    this.iconColor = Colors.black,
    this.badgeColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Obx(() {
      final itemCount = cartController.cartItems.length;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoute.cart),
            icon: Icon(
              itemCount == 0
                  ? Icons.shopping_cart_outlined
                  : Icons.shopping_cart,
              size: iconSize,
              color: iconColor,
            ),
          ),
          if (itemCount > 0)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),
                child: Text(
                  '$itemCount',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      );
    });
  }
}
