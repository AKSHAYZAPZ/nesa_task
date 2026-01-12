import 'package:get/get.dart';
import 'package:nesa_machine_test/screens/cart_screen.dart';
import 'package:nesa_machine_test/screens/product_detail_screen.dart';
import 'package:nesa_machine_test/screens/product_list_screen.dart';
import 'package:nesa_machine_test/screens/update_product_screen.dart';

import '../../screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> appPages = <GetPage>[
    GetPage(
      name: AppRoute.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoute.productDetail,
      page: () => ProductDetailsScreen(),
    ),
    GetPage(
      name: AppRoute.productList,
      page: () => ProductListScreen(),
    ),
    GetPage(
      name: AppRoute.updateProduct,
      page: () => UpdateProductScreen(),
    ),
    GetPage(
      name: AppRoute.cart,
      page: () => CartScreen(),
    ),
  ];
}
