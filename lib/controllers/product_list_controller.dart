import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductListController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final productsByCategory = <String, List<Product>>{}.obs;
  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;
  RxBool isError = false.obs;

  int page = 1;
  final int limit = 30;
  int totalProducts = 0;
  final wishlistIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !isMoreLoading.value &&
        productsCount < totalProducts) {
      fetchProducts();
    }
  }

  int get productsCount =>
      productsByCategory.values.fold(0, (sum, list) => sum + list.length);

  Future<void> fetchProducts() async {
    if (page == 1) {
      isLoading.value = true;
    } else {
      isMoreLoading.value = true;
    }
    try {
      final response = await ApiServices.getProducts(limit: limit, page: page);
      totalProducts = response.total;

      for (var product in response.products) {
        if (!productsByCategory.containsKey(product.category)) {
          productsByCategory[product.category] = [];
        }
        productsByCategory[product.category]!.add(product);
      }
      page++;
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
      isMoreLoading.value = false;
    }
  }

  bool isWishListed(int id) => wishlistIds.contains(id);

  toggleWishlist(int id) {
    wishlistIds.contains(id) ? wishlistIds.remove(id) : wishlistIds.add(id);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
