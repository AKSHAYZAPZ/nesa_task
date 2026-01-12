import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesa_machine_test/config/routes/app_routes.dart';
import 'package:nesa_machine_test/config/theme/app_colors.dart';
import 'package:nesa_machine_test/controllers/product_detail_controller.dart';
import '../controllers/product_list_controller.dart';
import '../widgets/Error_widget/error_view.dart';
import '../widgets/product_detail/app_button.dart';
import '../widgets/product_detail/delivery_card_info.dart';
import '../widgets/product_detail/product_detail_tab_switcher.dart';
import '../widgets/product_detail/product_image_section.dart';
import '../widgets/product_detail/review_tab.dart';
import '../widgets/product_detail/specification_tab.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final ProductDetailsController controller =
      Get.put(ProductDetailsController());
  final ProductListController listController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: BackButton(color: AppColors.black),
        actions: [
          Obx(() {
            return IconButton(
              onPressed: () {
                if (controller.productDetail.value != null) {
                  listController
                      .toggleWishlist(controller.productDetail.value!.id);
                }
              },
              icon: Icon(
                controller.productDetail.value != null &&
                        listController
                            .isWishListed(controller.productDetail.value!.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: controller.productDetail.value != null &&
                        listController
                            .isWishListed(controller.productDetail.value!.id)
                    ? AppColors.red
                    : AppColors.black,
              ),
            );
          }),
          Obx(
            () => controller.isLoading.value
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundColor: AppColors.purple,
                      child: IconButton(
                        onPressed: () {
                          if (controller.productDetail.value != null) {
                            Get.toNamed(
                              AppRoute.updateProduct,
                              arguments: controller.productDetail.value,
                            );
                          }
                        },
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () {
          if (controller.isLoading.value ||
              controller.productDetail.value == null) {
            return const SizedBox.shrink();
          }

          final inCart = controller.cartController.cartItems.any(
              (item) => item.product.id == controller.productDetail.value!.id);

          return AppButton(
            text: inCart ? 'VIEW IN CART' : 'ADD TO CART',
            onTap: controller.handleCartAction,
            color: inCart ? AppColors.green : AppColors.purple,
            prefixIcon: Icon(
              inCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
              color: AppColors.white,
            ),
          );
        },
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.isError.value) {
          return ErrorView(
            onTap: () => controller.fetchProductDetail(),
          );
        }
        final product = controller.productDetail.value;
        if (product == null) {
          return const Center(child: Text("Product not found"));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ProductImageSection(
              images: product.images,
              selectedIndex: controller.selectedImage.value,
              onSelect: controller.selectImage,
            ),
            const SizedBox(height: 16),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: AppColors.litePink,
                child: Text(
                  ' Best Seller ',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
              ),
            ),
            Text(
              product.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ProductDetailTabSwitcher(),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Obx(() {
              return controller.selectedTab.value == 0
                  ? SpecificationTab(product: product)
                  : ReviewsTab(reviews: product.reviews);
            }),
            const SizedBox(height: 20),
            DeliveryInfoCard(
              shippingInfo: product.shippingInformation,
            ),
          ],
        );
      }),
    );
  }
}
