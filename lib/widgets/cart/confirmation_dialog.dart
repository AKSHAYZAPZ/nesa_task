import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/theme/app_colors.dart';
import '../product_detail/app_button.dart';

class ConfirmationDialog {
  static void show({
    String title = "Alert",
    required String message,
    String confirmText = "OK",
    String cancelText = "Cancel",
    VoidCallback? onConfirm,
    bool showCancel = false,
  }) {
    Get.defaultDialog(
      backgroundColor: AppColors.white,
      title: title,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      middleText: message,
      middleTextStyle: const TextStyle(fontSize: 16),
      barrierDismissible: false,
      textCancel: showCancel ? cancelText : null,
      confirm: AppButton(
        text: confirmText,
        height: 40,
        width: 100,
        onTap: () {
          Get.back();
          if (onConfirm != null) onConfirm();
        },
      ),
      cancel: AppButton(
        text: cancelText,
        height: 40,
        width: 100,
        color: Colors.grey.shade300,
        textColor: AppColors.black,
        onTap: () {
          Get.back();
        },
      ),
    );
  }
}
