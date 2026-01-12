import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:nesa_machine_test/config/theme/app_colors.dart';
import 'package:nesa_machine_test/controllers/product_detail_controller.dart';
import 'package:nesa_machine_test/controllers/product_list_controller.dart';
import '../models/product_detail_model.dart';
import '../services/api_service.dart';
import '../widgets/product_list/app_snackbar.dart';

class UpdateProductController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxBool isLoading = false.obs;
  ProductDetail? product;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
    titleController = TextEditingController(text: product?.title);
    priceController = TextEditingController(text: product?.price.toString());
    descriptionController = TextEditingController(text: product?.description);
  }

  Future<void> updateProduct() async {
    isLoading.value = true;
    try {
      final updated = await ApiServices.updateProduct(
        id: product!.id,
        title: titleController.text,
        price: double.parse(priceController.text),
        description: descriptionController.text,
      );

      final detailController = Get.find<ProductDetailsController>();
      detailController.productDetail.value =
          detailController.productDetail.value?.copyWith(
        title: updated.title,
        price: updated.price,
        description: updated.description,
      );
      final listController = Get.find<ProductListController>();

      listController.productsByCategory.forEach((category, products) {
        final index = products.indexWhere((p) => p.id == updated.id);
        if (index != -1) {
          products[index] = products[index].copyWith(
            title: updated.title,
            price: updated.price,
            description: updated.description,
          );
        }
      });
      listController.productsByCategory.refresh();

      Get.back();
      AppSnackbar.show(
        "Product updated successfully",
        title: "Success",
        backgroundColor: AppColors.green,
        icon: Icons.check_circle,
      );
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
