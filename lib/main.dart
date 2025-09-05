import 'package:flutter/material.dart';
import 'package:food/features/my_orders/presentation/views/my_orders_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyOrdersView());
  }
}
