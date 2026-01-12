import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesa_machine_test/controllers/splash_controller.dart';

import '../config/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) {
            return Opacity(
              opacity: controller.fadeAnimation.value,
              child: Transform.scale(
                scale: controller.scaleAnimation.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple.shade50,
                      ),
                      child: Icon(
                        Icons.shopping_bag,
                        size: 60,
                        color: AppColors.purple,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Nesa Store",
                      style: TextStyle(
                        fontSize: 26,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Powered by Nesa Software",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade50,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
