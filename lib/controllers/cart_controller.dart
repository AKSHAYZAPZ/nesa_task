import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme/app_colors.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../widgets/cart/confirmation_dialog.dart';
import '../widgets/product_list/app_snackbar.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }

    AppSnackbar.show(
      "Item added to cart",
      title: "Success",
      backgroundColor: AppColors.green,
      icon: Icons.check_circle,
    );
  }

  void removeItem(CartItem item) {
    cartItems.remove(item);
  }

  increaseQuantity(CartItem item) {
    item.quantity++;
    cartItems.refresh();
  }

  decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      cartItems.remove(item);
    }
    cartItems.refresh();
  }

  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + (item.product.price * item.quantity));

  void placeOrder() {
    if (cartItems.isEmpty) {
      AppSnackbar.show("Cart is empty", backgroundColor: AppColors.red);
      return;
    }

    ConfirmationDialog.show(
      title: "Place Order",
      message: "Are you sure you want to place the order?",
      confirmText: "Yes",
      onConfirm: () {
        cartItems.clear();
        AppSnackbar.show("Order placed successfully!",
            backgroundColor: AppColors.green);
      },
    );
  }
}
