import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesa_machine_test/config/theme/app_colors.dart';

import 'config/routes/app_pages.dart';
import 'config/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nesa Machine Test',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.white,
              surfaceTintColor: AppColors.white,
              elevation: 0)),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,
      getPages: AppPages.appPages,
    );
  }
}
