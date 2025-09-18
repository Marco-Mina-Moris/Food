import 'package:flutter/material.dart';
import 'package:food/features/home/view/screens/home_screen.dart';

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
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      // initialRoute: AppRoutes.splash,
      // onGenerateRoute: AppRoutes.generateRoute,
      home: HomeScreen(),
    );
  }
}
