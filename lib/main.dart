import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food/features/my_cart/presentation/views/my_cart_view.dart';
import 'package:food/features/my_orders/presentation/views/my_orders_view.dart';

import 'package:food/features/profile/presentation/views/profile_view.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}
