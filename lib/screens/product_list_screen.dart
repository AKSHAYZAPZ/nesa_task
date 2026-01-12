import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesa_machine_test/config/theme/app_colors.dart';
import 'package:nesa_machine_test/widgets/Error_widget/error_view.dart';
import 'package:nesa_machine_test/widgets/shimmer_container.dart';
import '../controllers/cart_controller.dart';
import '../controllers/product_list_controller.dart';
import '../widgets/cart/cart_badge.dart';
import '../widgets/product_list/product_card.dart';
import '../widgets/product_list/product_list_header.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final controller = Get.put(ProductListController());
    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          CartIconBadge(),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.isError.value) {
            return ErrorView(
              onTap: () => controller.fetchProducts(),
            );
          }
          return ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              heading(context),
              const SizedBox(height: 5),
              ...controller.productsByCategory.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductListHeader(
                      title: entry.key,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: entry.value.length,
                        itemBuilder: (_, index) {
                          final product = entry.value[index];
                          return ProductCard(
                            product: product,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
              if (controller.isMoreLoading.value)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget heading(context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover our exclusive\nproducts',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: size.width * 0.75,
            child: Text(
              'In this marketplace, you will find various technics in the cheapest price',
              style: TextStyle(color: AppColors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
