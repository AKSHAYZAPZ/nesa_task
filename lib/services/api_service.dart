import 'package:dio/dio.dart';

import '../config/constants/api_urls.dart';
import '../models/product_detail_model.dart';
import '../models/product_model.dart';

class ApiServices {
  static final Dio dio = Dio();
  static Future<ProductResponse> getProducts({
    required int limit,
    required int page,
  }) async {
    print(page);
    print((page - 1) * limit);
    try {
      final response = await dio.get(
        ApiConstants.products,
        queryParameters: {
          "limit": limit,
          "skip": (page - 1) * limit,
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        return ProductResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
      throw Exception("API Error: $e");
    }
  }

  static Future<ProductDetail> getProductDetail(int productId) async {
    try {
      final response = await dio.get("${ApiConstants.products}/$productId");
      if (response.statusCode == 200) {
        return ProductDetail.fromJson(response.data);
      } else {
        throw Exception("Failed to load product details");
      }
    } catch (e) {
      print(e);
      throw Exception("API Error: $e");
    }
  }

  static Future<Product> updateProduct({
    required int id,
    required String title,
    required double price,
    required String description,
  }) async {
    try {
      final response = await dio.put(
        "${ApiConstants.products}/$id",
        data: {
          "title": title,
          "price": price,
          "description": description,
        },
      );

      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception("Failed to update product");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }
}
