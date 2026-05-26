import 'package:dio/dio.dart';

import '../../features/category_meals/model/meal.dart';
import '../../features/home/model/response/category2_response.dart';
import '../../features/home/model/response/restaurants_response.dart';
import '../../features/meal_details/model/meal_detail_response.dart';

// class HomeApi {
//  final Dio _dio = Dio(
//   BaseOptions(
//    baseUrl: "https://dummyjson.com", // الـ baseUrl
//    connectTimeout: const Duration(seconds: 10),
//    receiveTimeout: const Duration(seconds: 10),
//   ),
//  );
//
//  Future<List<CategoryResponse>> getCategories() async {
//   try {
//    final response = await _dio.get("/products/categories");
//
//    if (response.statusCode == 200) {
//     List<dynamic> data = response.data;
//     return data.map((e) => CategoryResponse.fromJson(e)).toList();
//    } else {
//     throw Exception("Error: ${response.statusCode}");
//    }
//   } catch (e) {
//    throw Exception("Failed to load categories: $e");
//   }
//  }
// }
class HomeApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // static Future<List<CategoryResponse>> getCategories() async {
  //   try {
  //     final response = await _dio.get('products/categories'); // GET request
  //     if (response.statusCode == 200) {
  //       final data = response.data as List;
  //       return data
  //           .map((category) => CategoryResponse.fromJson(category))
  //           .toList();
  //     } else {
  //       throw Exception('Failed to load categories: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error while fetching categories: $e');
  //   }
  // }

  static Future<RestaurantMenuResponse> getRecipes({int limit = 20}) async {
    try {
      final response = await _dio.get(
        'recipes',
        queryParameters: {"limit": limit},
      );
      if (response.statusCode == 200) {
        return RestaurantMenuResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load recipes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching recipes: $e');
    }
  }

  // static Future<List<Recipes>> getRecipes({int limit = 20}) async {
  //  try {
  //   final response = await _dio.get(
  //    'recipes',
  //    queryParameters: {"limit": limit},
  //   );
  //   if (response.statusCode == 200) {
  //    final result = RestaurantMenuResponse.fromJson(response.data);
  //    return result.recipes ?? [];
  //   } else {
  //    throw Exception('Failed to load recipes: ${response.statusCode}');
  //   }
  //  } catch (e) {
  //   throw Exception('Error while fetching recipes: $e');
  //  }
  // }
  // static Future<RestaurantMenuResponse> getMealsByCategory(
  //   String categorySlug,
  // ) async {
  //   try {
  //     final response = await _dio.get("/products/category/$categorySlug");
  //     return RestaurantMenuResponse.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception("Failed to load meals: $e");
  //   }
  // }
  // Future<List<ProductResponse>> getProductsByCategory(
  //   String categorySlug,
  // ) async {
  //   try {
  //     final response = await _dio.get("/products/category/$categorySlug");
  //
  //     final List products = response.data["products"];
  //     return products.map((e) => ProductResponse.fromJson(e)).toList();
  //   } catch (e) {
  //     throw Exception("Failed to load products: $e");
  //   }
  // }
  // Future<ProductResponse> getProductsByCategory(String categorySlug) async {
  //   try {
  //     final response = await _dio.get("/products/category/$categorySlug");
  //     return ProductResponse.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception("Failed to load products: $e");
  //   }
  // }

  // Future<ProductOfCategory> getProductsOfCategory(String categorySlug) async {
  //   try {
  //     final response = await _dio.get("/products/category/$categorySlug");
  //
  //     // هنا بيرجع object من نوع ProductOfCategory
  //     return ProductOfCategory.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception("Failed to load products: $e");
  //   }
  // }

  static Future<CategoryResponse2> getCategories2() async {
    try {
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/categories.php',
      );
      if (response.statusCode == 200) {
        return CategoryResponse2.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching categories: $e');
    }
  }

  static Future<MealResponse> getMealsByCategory(String categoryName) async {
    try {
      final response = await _dio.get(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName",
      );
      if (response.statusCode == 200) {
        return MealResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load meals: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching meals: $e');
    }
  }

  static Future<MealDetailResponse> getMealDetails(String mealId) async {
    try {
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId',
      );
      if (response.statusCode == 200) {
        return MealDetailResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load meal details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching meal details: $e');
    }
  }
}
