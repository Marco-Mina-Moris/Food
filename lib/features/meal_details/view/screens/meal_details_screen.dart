// // import 'package:flutter/material.dart';
// //
// // import '../../../../core/constants/app_apis.dart';
// // import '../../model/response/meal_detail_response.dart';
// //
// // class MealDetailsScreen extends StatelessWidget {
// //   final String mealId;
// //
// //   const MealDetailsScreen({super.key, required this.mealId});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Meal Details")),
// //       body: FutureBuilder<MealDetailResponse>(
// //         future: HomeApi.getMealDetails(mealId),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.hasError) {
// //             return Center(child: Text("Error: ${snapshot.error}"));
// //           }
// //           if (!snapshot.hasData || snapshot.data!.meals == null) {
// //             return const Center(child: Text("Meal details not found"));
// //           }
// //
// //           final meal = snapshot.data!.meals!.first;
// //
// //           return SingleChildScrollView(
// //             padding: const EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // صورة الأكلة
// //                 Center(
// //                   child: Image.network(
// //                     meal.strMealThumb ?? "",
// //                     height: 250,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //
// //                 // اسم الأكلة
// //                 Text(
// //                   meal.strMeal ?? "No Name",
// //                   style: const TextStyle(
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 10),
// //                 Text("Category: ${meal.strCategory ?? ""}"),
// //                 Text("Area: ${meal.strArea ?? ""}"),
// //
// //                 const SizedBox(height: 20),
// //
// //                 // الوصف / التعليمات
// //                 Text(
// //                   meal.strInstructions ?? "",
// //                   style: const TextStyle(fontSize: 16, height: 1.5),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// import '../../../../core/constants/app_apis.dart';
// import '../../model/response/meal_detail_response.dart';
//
// class MealDetailsScreen extends StatelessWidget {
//   final String mealId;
//
//   const MealDetailsScreen({super.key, required this.mealId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Meal Details")),
//       body: FutureBuilder<MealDetailResponse>(
//         future: HomeApi.getMealDetails(mealId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           if (!snapshot.hasData || snapshot.data!.meals == null) {
//             return const Center(child: Text("Meal details not found"));
//           }
//
//           final meal = snapshot.data!.meals!.first;
//
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.network(
//                   meal.strMealThumb ?? "",
//                   width: double.infinity,
//                   height: 250,
//                   fit: BoxFit.cover,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         meal.strMeal ?? "No Name",
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text("Category: ${meal.strCategory ?? ""}"),
//                       Text("Area: ${meal.strArea ?? ""}"),
//                       const SizedBox(height: 16),
//                       Text(
//                         "Instructions:",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         meal.strInstructions ?? "",
//                         style: const TextStyle(fontSize: 16, height: 1.5),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../../../../core/constants/app_apis.dart';
// import '../../model/response/meal_detail_response.dart';
//
// class MealDetailsScreen extends StatelessWidget {
//   final String mealId;
//
//   const MealDetailsScreen({super.key, required this.mealId});
//
//   // بيانات وهمية لكل كاتيجوري
//   static final Map<String, Map<String, dynamic>> mockData = {
//     "Beef": {"price": 35, "rating": 4.8, "time": 30},
//     "Chicken": {"price": 28, "rating": 4.6, "time": 22},
//     "Dessert": {"price": 20, "rating": 4.2, "time": 15},
//     "Seafood": {"price": 40, "rating": 4.9, "time": 25},
//     "Vegan": {"price": 25, "rating": 4.4, "time": 18},
//     "Vegetarian": {"price": 22, "rating": 4.5, "time": 20},
//     "Pasta": {"price": 30, "rating": 4.7, "time": 19},
//     "Lamb": {"price": 33, "rating": 4.6, "time": 27},
//     "Breakfast": {"price": 15, "rating": 4.3, "time": 10},
//     "default": {"price": 20, "rating": 4.5, "time": 25},
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text("Details"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black,
//       ),
//       body: FutureBuilder<MealDetailResponse>(
//         future: HomeApi.getMealDetails(mealId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           if (!snapshot.hasData || snapshot.data!.meals == null) {
//             return const Center(child: Text("Meal details not found"));
//           }
//
//           final meal = snapshot.data!.meals!.first;
//
//           // نجيب البيانات حسب الكاتيجوري
//           final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
//           final price = fakeData["price"];
//           final rating = fakeData["rating"];
//           final time = fakeData["time"];
//
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // صورة الأكلة
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   color: Colors.orange[50],
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.network(
//                       meal.strMealThumb ?? "",
//                       height: 220,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//
//                 // التفاصيل
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons.store, size: 18, color: Colors.red),
//                           const SizedBox(width: 6),
//                           Text(
//                             "Uttora Coffe House",
//                             style: TextStyle(color: Colors.grey[600]),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//
//                       Text(
//                         meal.strMeal ?? "No Name",
//                         style: const TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//
//                       Text(
//                         "Category: ${meal.strCategory ?? ""} | Area: ${meal.strArea ?? ""}",
//                         style: TextStyle(color: Colors.grey[600]),
//                       ),
//                       const SizedBox(height: 12),
//
//                       // تقييم + توصيل + وقت
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.star,
//                                 color: Colors.orange,
//                                 size: 18,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(rating.toString()),
//                             ],
//                           ),
//                           const Text("Free Delivery"),
//                           Row(
//                             children: [
//                               const Icon(Icons.timer, size: 18),
//                               const SizedBox(width: 4),
//                               Text("$time min"),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//
//                       // اختيار الحجم
//                       const Text(
//                         "SIZE:",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           ChoiceChip(
//                             label: const Text("10\""),
//                             selected: false,
//                           ),
//                           const SizedBox(width: 8),
//                           ChoiceChip(label: const Text("14\""), selected: true),
//                           const SizedBox(width: 8),
//                           ChoiceChip(
//                             label: const Text("16\""),
//                             selected: false,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//
//                       const Text(
//                         "INGREDIENTS",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: const [
//                           CircleAvatar(
//                             backgroundColor: Colors.orangeAccent,
//                             child: Icon(Icons.local_pizza, color: Colors.white),
//                           ),
//                           SizedBox(width: 10),
//                           CircleAvatar(
//                             backgroundColor: Colors.orangeAccent,
//                             child: Icon(Icons.rice_bowl, color: Colors.white),
//                           ),
//                           SizedBox(width: 10),
//                           CircleAvatar(
//                             backgroundColor: Colors.orangeAccent,
//                             child: Icon(Icons.fastfood, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//
//       // السعر و الكمية
//       bottomNavigationBar: FutureBuilder<MealDetailResponse>(
//         future: HomeApi.getMealDetails(mealId),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData || snapshot.data!.meals == null) {
//             return const SizedBox();
//           }
//
//           final meal = snapshot.data!.meals!.first;
//           final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
//           final price = fakeData["price"];
//
//           return Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 5,
//                   offset: const Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "\$$price",
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.remove, color: Colors.white),
//                       ),
//                       const Text(
//                         "2",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.add, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// import '../../../../core/constants/app_apis.dart';
// import '../../model/response/meal_detail_response.dart';
//
// class MealDetailsScreen extends StatefulWidget {
//   final String mealId;
//
//   const MealDetailsScreen({super.key, required this.mealId});
//
//   @override
//   State<MealDetailsScreen> createState() => _MealDetailsScreenState();
// }
//
// class _MealDetailsScreenState extends State<MealDetailsScreen> {
//   int quantity = 1;
//   String selectedSize = "Medium";
//
//   // بيانات وهمية لكل كاتيجوري
//   static final Map<String, Map<String, dynamic>> mockData = {
//     "Beef": {"price": 35, "rating": 4.8, "time": 30},
//     "Chicken": {"price": 28, "rating": 4.6, "time": 22},
//     "Dessert": {"price": 20, "rating": 4.2, "time": 15},
//     "Seafood": {"price": 40, "rating": 4.9, "time": 25},
//     "Vegan": {"price": 25, "rating": 4.4, "time": 18},
//     "Vegetarian": {"price": 22, "rating": 4.5, "time": 20},
//     "Pasta": {"price": 30, "rating": 4.7, "time": 19},
//     "Lamb": {"price": 33, "rating": 4.6, "time": 27},
//     "Breakfast": {"price": 15, "rating": 4.3, "time": 10},
//     "default": {"price": 20, "rating": 4.5, "time": 25},
//   };
//
//   // أسعار الأحجام
//   static final Map<String, Map<String, int>> sizePrices = {
//     "Small": {"multiplier": 1},
//     "Medium": {"multiplier": 2},
//     "Large": {"multiplier": 3},
//   };
//
//   // مكونات لكل كاتيجوري
//   static final Map<String, List<String>> ingredientsData = {
//     "Beef": ["Beef slices", "Garlic", "Onion", "Pepper"],
//     "Chicken": ["Chicken breast", "Yogurt", "Lemon", "Spices"],
//     "Dessert": ["Milk", "Sugar", "Butter", "Chocolate"],
//     "Seafood": ["Shrimp", "Garlic", "Olive oil", "Parsley"],
//     "Vegan": ["Lentils", "Spinach", "Avocado", "Mushrooms"],
//     "Vegetarian": ["Carrot", "Potato", "Tomato", "Zucchini"],
//     "Pasta": ["Pasta", "Tomato sauce", "Cheese", "Basil"],
//     "Lamb": ["Lamb meat", "Onion", "Rosemary", "Garlic"],
//     "Breakfast": ["Eggs", "Bread", "Butter", "Cheese"],
//     "default": ["Rice", "Beans", "Herbs", "Sauce"],
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text("Details"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black,
//       ),
//       body: FutureBuilder<MealDetailResponse>(
//         future: HomeApi.getMealDetails(widget.mealId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           if (!snapshot.hasData || snapshot.data!.meals == null) {
//             return const Center(child: Text("Meal details not found"));
//           }
//
//           final meal = snapshot.data!.meals!.first;
//
//           // نجيب البيانات حسب الكاتيجوري
//           final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
//           final basePrice = fakeData["price"];
//           final rating = fakeData["rating"];
//           final time = fakeData["time"];
//
//           // نجيب المكونات
//           final ingredients =
//               ingredientsData[meal.strCategory] ?? ingredientsData["default"]!;
//
//           // السعر الكلي
//           final totalPrice =
//               (basePrice * sizePrices[selectedSize]!["multiplier"]!) * quantity;
//
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // صورة الأكلة
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   color: Colors.orange[50],
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.network(
//                       meal.strMealThumb ?? "",
//                       height: 220,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//
//                 // التفاصيل
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons.store, size: 18, color: Colors.red),
//                           const SizedBox(width: 6),
//                           Text(
//                             "Uttora Coffe House",
//                             style: TextStyle(color: Colors.grey[600]),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//
//                       Text(
//                         meal.strMeal ?? "No Name",
//                         style: const TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//
//                       Text(
//                         "Category: ${meal.strCategory ?? ""} | Area: ${meal.strArea ?? ""}",
//                         style: TextStyle(color: Colors.grey[600]),
//                       ),
//                       const SizedBox(height: 12),
//
//                       // تقييم + توصيل + وقت
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.star,
//                                 color: Colors.orange,
//                                 size: 18,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(rating.toString()),
//                             ],
//                           ),
//                           const Text("Free Delivery"),
//                           Row(
//                             children: [
//                               const Icon(Icons.timer, size: 18),
//                               const SizedBox(width: 4),
//                               Text("$time min"),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//
//                       // اختيار الحجم
//                       const Text(
//                         "SIZE:",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children:
//                             sizePrices.keys.map((size) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: ChoiceChip(
//                                   label: Text(size),
//                                   selected: selectedSize == size,
//                                   onSelected: (val) {
//                                     setState(() {
//                                       selectedSize = size;
//                                     });
//                                   },
//                                 ),
//                               );
//                             }).toList(),
//                       ),
//                       const SizedBox(height: 20),
//
//                       // المكونات
//                       const Text(
//                         "INGREDIENTS",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children:
//                             ingredients
//                                 .map(
//                                   (item) => Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 4,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         const Icon(
//                                           Icons.check,
//                                           color: Colors.orange,
//                                         ),
//                                         const SizedBox(width: 6),
//                                         Text(item),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                                 .toList(),
//                       ),
//                       const SizedBox(height: 30),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//
//       // السعر و الكمية
//       bottomNavigationBar: FutureBuilder<MealDetailResponse>(
//         future: HomeApi.getMealDetails(widget.mealId),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData || snapshot.data!.meals == null) {
//             return const SizedBox();
//           }
//
//           final meal = snapshot.data!.meals!.first;
//           final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
//           final basePrice = fakeData["price"];
//
//           final totalPrice =
//               (basePrice * sizePrices[selectedSize]!["multiplier"]!) * quantity;
//
//           return Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 5,
//                   offset: const Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "\$$totalPrice",
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           if (quantity > 1) {
//                             setState(() {
//                               quantity--;
//                             });
//                           }
//                         },
//                         icon: const Icon(Icons.remove, color: Colors.white),
//                       ),
//                       Text(
//                         "$quantity",
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             quantity++;
//                           });
//                         },
//                         icon: const Icon(Icons.add, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../../core/constants/app_apis.dart';
import '../../model/meal_detail_response.dart';

class MealDetailsScreen extends StatefulWidget {
  final String mealId;

  const MealDetailsScreen({super.key, required this.mealId});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int quantity = 1;
  String selectedSize = "Medium";
  bool isFavorite = false;

  // بيانات وهمية لكل كاتيجوري
  static final Map<String, Map<String, dynamic>> mockData = {
    "Beef": {"price": 35, "rating": 4.8, "time": 30},
    "Chicken": {"price": 28, "rating": 4.6, "time": 22},
    "Dessert": {"price": 20, "rating": 4.2, "time": 15},
    "Seafood": {"price": 40, "rating": 4.9, "time": 25},
    "Vegan": {"price": 25, "rating": 4.4, "time": 18},
    "Vegetarian": {"price": 22, "rating": 4.5, "time": 20},
    "Pasta": {"price": 30, "rating": 4.7, "time": 19},
    "Lamb": {"price": 33, "rating": 4.6, "time": 27},
    "Breakfast": {"price": 15, "rating": 4.3, "time": 10},
    "default": {"price": 20, "rating": 4.5, "time": 25},
  };

  // أسعار الأحجام
  static final Map<String, Map<String, int>> sizePrices = {
    "Small": {"multiplier": 1},
    "Medium": {"multiplier": 2},
    "Large": {"multiplier": 3},
  };

  // مكونات لكل كاتيجوري
  static final Map<String, List<String>> ingredientsData = {
    "Beef": ["Beef slices", "Garlic", "Onion", "Pepper"],
    "Chicken": ["Chicken breast", "Yogurt", "Lemon", "Spices"],
    "Dessert": ["Milk", "Sugar", "Butter", "Chocolate"],
    "Seafood": ["Shrimp", "Garlic", "Olive oil", "Parsley"],
    "Vegan": ["Lentils", "Spinach", "Avocado", "Mushrooms"],
    "Vegetarian": ["Carrot", "Potato", "Tomato", "Zucchini"],
    "Pasta": ["Pasta", "Tomato sauce", "Cheese", "Basil"],
    "Lamb": ["Lamb meat", "Onion", "Rosemary", "Garlic"],
    "Breakfast": ["Eggs", "Bread", "Butter", "Cheese"],
    "default": ["Rice", "Beans", "Herbs", "Sauce"],
  };

  // أيقونات لكل مكوّن
  static final Map<String, IconData> ingredientIcons = {
    "Beef slices": Icons.set_meal,
    "Chicken breast": Icons.restaurant,
    "Shrimp": Icons.water,
    "Garlic": Icons.eco,
    "Onion": Icons.spa,
    "Pepper": Icons.local_fire_department,
    "Yogurt": Icons.local_drink,
    "Lemon": Icons.emoji_food_beverage,
    "Spices": Icons.flare,
    "Milk": Icons.local_drink,
    "Sugar": Icons.cake,
    "Butter": Icons.bakery_dining,
    "Chocolate": Icons.icecream,
    "Olive oil": Icons.liquor,
    "Parsley": Icons.grass,
    "Lentils": Icons.rice_bowl,
    "Spinach": Icons.eco,
    "Avocado": Icons.emoji_food_beverage,
    "Mushrooms": Icons.local_florist,
    "Carrot": Icons.local_dining,
    "Potato": Icons.dinner_dining,
    "Tomato": Icons.local_pizza,
    "Zucchini": Icons.restaurant_menu,
    "Pasta": Icons.food_bank,
    "Tomato sauce": Icons.soup_kitchen,
    "Cheese": Icons.emoji_food_beverage,
    "Basil": Icons.spa,
    "Lamb meat": Icons.set_meal,
    "Rosemary": Icons.grass,
    "Eggs": Icons.egg,
    "Bread": Icons.bakery_dining,
    "Rice": Icons.rice_bowl,
    "Beans": Icons.eco,
    "Herbs": Icons.local_florist,
    "Sauce": Icons.soup_kitchen,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<MealDetailResponse>(
        future: HomeApi.getMealDetails(widget.mealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.meals == null) {
            return const Center(child: Text("Meal details not found"));
          }

          final meal = snapshot.data!.meals!.first;

          // نجيب البيانات حسب الكاتيجوري
          final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
          final basePrice = fakeData["price"];
          final rating = fakeData["rating"];
          final time = fakeData["time"];

          // نجيب المكونات
          final ingredients =
              ingredientsData[meal.strCategory] ?? ingredientsData["default"]!;

          // السعر الكلي
          final totalPrice =
              (basePrice * sizePrices[selectedSize]!["multiplier"]!) * quantity;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // صورة الأكلة
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //
                //   child: Container(
                //     padding: const EdgeInsets.all(16),
                //     color: Colors.orange[100],
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(16),
                //       child: Image.network(
                //         meal.strMealThumb ?? "",
                //         height: 220,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      // صورة الأكل
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          meal.strMealThumb ?? "",
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // أيقونة القلب فوق يمين الصورة
                      Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.black54,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // التفاصيل
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.store, size: 18, color: Colors.red),
                          const SizedBox(width: 6),
                          Text(
                            "Uttora Coffe House",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Text(
                        meal.strMeal ?? "No Name",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Text(
                        "Category: ${meal.strCategory ?? ""} | Area: ${meal.strArea ?? ""}",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 12),

                      // تقييم + توصيل + وقت
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(rating.toString()),
                            ],
                          ),
                          const Text("Free Delivery"),
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 18),
                              const SizedBox(width: 4),
                              Text("$time min"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // اختيار الحجم
                      const Text(
                        "SIZE:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children:
                            sizePrices.keys.map((size) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: ChoiceChip(
                                  label: Text(size),
                                  selected: selectedSize == size,
                                  onSelected: (val) {
                                    setState(() {
                                      selectedSize = size;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                      ),
                      const SizedBox(height: 20),

                      // المكونات
                      const Text(
                        "INGREDIENTS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            ingredients
                                .map(
                                  (item) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          ingredientIcons[item] ??
                                              Icons.fastfood,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(item),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // السعر و الكمية
      bottomNavigationBar: FutureBuilder<MealDetailResponse>(
        future: HomeApi.getMealDetails(widget.mealId),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.meals == null) {
            return const SizedBox();
          }

          final meal = snapshot.data!.meals!.first;
          final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
          final basePrice = fakeData["price"];
          final totalPrice =
              (basePrice * sizePrices[selectedSize]!["multiplier"]!) * quantity;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$totalPrice",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove, color: Colors.white),
                      ),
                      Text(
                        "$quantity",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
