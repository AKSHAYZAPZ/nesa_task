import 'package:get/get.dart';
import 'package:nesa_machine_test/config/routes/app_routes.dart';

import '../controllers/cart_controller.dart';
import '../models/product_detail_model.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductDetailsController extends GetxController {
  Rx<int> selectedImage = 0.obs;
  Rx<int> selectedTab = 0.obs;
  int? productId;

  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  Rx<ProductDetail?> productDetail = Rx<ProductDetail?>(null);

  final CartController cartController = Get.find<CartController>();

  @override
  void onInit() {
    productId = Get.arguments;
    fetchProductDetail();
    super.onInit();
  }

  void fetchProductDetail() async {
    if (productId == null) return;
    try {
      isLoading.value = true;
      isError.value = false;
      final detail = await ApiServices.getProductDetail(productId!);
      productDetail.value = detail;
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void selectImage(int index) => selectedImage.value = index;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void handleCartAction() {
    final product = productDetail.value;
    if (product == null) return;

    final alreadyInCart =
        cartController.cartItems.any((item) => item.product.id == product.id);

    if (alreadyInCart) {
      Get.toNamed(AppRoute.cart);
    } else {
      cartController.addToCart(
        Product(
          id: product.id,
          title: product.title,
          category: product.category,
          price: product.price,
          thumbnail: product.thumbnail,
          description: product.description,
        ),
      );
    }
  }
}
