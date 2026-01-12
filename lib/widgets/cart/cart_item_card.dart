import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesa_machine_test/models/cart_model.dart';

import '../../config/theme/app_colors.dart';
import '../../controllers/cart_controller.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${item.product.price.toString()}",
                  style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    InkWell(
                      onTap: () => cartController.decreaseQuantity(item),
                      child: Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => cartController.increaseQuantity(item),
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 25,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 12),
              InkWell(
                onTap: () => cartController.removeItem(item),
                child: Icon(
                  Icons.delete_outline,
                  size: 22,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
