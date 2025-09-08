import 'package:flutter/material.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/features/home/home_screen.dart';

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
