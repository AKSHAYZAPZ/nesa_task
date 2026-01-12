import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesa_machine_test/controllers/update_product_controller.dart';

import '../config/validators/validators.dart';
import '../widgets/product_detail/app_button.dart';
import '../widgets/update_product/app_textfield.dart';

class UpdateProductScreen extends StatelessWidget {
  UpdateProductScreen({super.key});

  final controller = Get.put(UpdateProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Product"),
          centerTitle: true,
        ),
        bottomNavigationBar: Obx(
          () => AppButton(
              text: 'Save Changes',
              width: Get.width,
              isLoading: controller.isLoading.value,
              onTap: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.updateProduct();
                }
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                AppTextFormField(
                  label: "Name",
                  controller: controller.titleController,
                  validator: (value) =>
                      Validators.validateNotEmpty(value, field: "Name"),
                ),
                const SizedBox(height: 14),
                AppTextFormField(
                  label: "Price",
                  controller: controller.priceController,
                  keyboardType: TextInputType.number,
                  validator: Validators.validatePrice,
                ),
                const SizedBox(height: 14),
                AppTextFormField(
                  label: "Description",
                  controller: controller.descriptionController,
                  maxLines: 3,
                  validator: (value) =>
                      Validators.validateNotEmpty(value, field: "Description"),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ));
  }
}
