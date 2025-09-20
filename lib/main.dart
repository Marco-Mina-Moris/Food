import 'package:flutter/material.dart';

import 'feature/app_section/app_section.dart';

void main() async {
  // List <CategoryResponse> data=await HomeApi.getCategories();
  // log(data.toString());
  // log(data.length.toString());
  //  RestaurantMenuResponse data1=await HomeApi.getRecipes();
  // log(data1.toString());
  // log(data1.limit.toString());
  // final recipesResponse = await HomeApi.getRecipes(limit: 20);
  // log(recipesResponse.toString());
  // log(recipesResponse.limit.toString());

  runApp(FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      // initialRoute: AppRoutes.splash,
      // onGenerateRoute: AppRoutes.generateRoute,
      home: AppSection(),
    );
  }
}
