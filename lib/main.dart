import 'package:flutter/material.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/features/home/screens/home_screen.dart';

import 'features/food_burgers/view/screens/food_burgers.dart';
import 'features/food_details/view/screens/food_details.dart';
import 'features/restaurant_view/view/screens/restaurant_view.dart';
import 'features/restaurant_view/view/screens/restaurant_view2.dart';

void main() {
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
