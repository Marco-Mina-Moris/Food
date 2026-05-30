import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/storage_helper/cart_manager.dart';
import 'package:food/features/user/meal_details/view/widgets/meal_detail_widget.dart';
import 'package:food/features/user/meal_details/view_model/model_detail_cubit.dart';
import 'package:food/core/dialogs/app_toasts.dart';
import 'package:toastification/toastification.dart';

import 'package:food/core/constants/app_apis.dart';
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

  static final Map<String, Map<String, int>> sizePrices = {
    "Small": {"multiplier": 1},
    "Medium": {"multiplier": 2},
    "Large": {"multiplier": 3},
  };

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
      body: BlocBuilder<ModelDetailCubit, ModelDetailState>(
        builder: (context, state) {
          //Loading
          if (state is ModelDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          //Error
          if (state is ModelDetailError) {
            return Center(
              child: Text(
                state.messageError,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          //Success
          final meal = context.watch<ModelDetailCubit>().modelDetail;
          if (meal == null) {
            return const Center(child: CircularProgressIndicator());
          }
          // نجيب البيانات حسب الكاتيجوري
          final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
          final rating = fakeData["rating"];
          final time = fakeData["time"];

          // نجيب المكونات
          final ingredients =
              ingredientsData[meal.strCategory] ?? ingredientsData["default"]!;

          // السعر الكلي يُحسب في bottomNavigationBar
          return MealDetailWidget(
            meal: meal,
            rating: rating,
            time: time,
            ingredients: ingredients,
            sizePrices: sizePrices,
            ingredientIcons: ingredientIcons,
            onSizeChanged: (size) {
              setState(() {
                selectedSize = size;
              });
            },
          );
        },
      ),

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$totalPrice",
                  style: GoogleFonts.sen(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.veryDarkBlue,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Quantity Counter Pill
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.bluegray,
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
                            icon: const Icon(Icons.remove, color: Colors.white, size: 16),
                          ),
                          Text(
                            "$quantity",
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(Icons.add, color: Colors.white, size: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Add To Cart Button
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          final fakeData = mockData[meal.strCategory] ?? mockData["default"]!;
                          final price = (fakeData["price"] as num).toDouble() * sizePrices[selectedSize]!["multiplier"]!;
                          
                          await CartManager.addToCart({
                            'idMeal': meal.idMeal,
                            'strMeal': meal.strMeal,
                            'strMealThumb': meal.strMealThumb,
                            'price': price,
                            'quantity': quantity,
                            'size': selectedSize,
                          });
                          
                          if (context.mounted) {
                            AppToast.showToast(
                              context: context,
                              title: "Success",
                              description: "${meal.strMeal} added to cart!",
                              type: ToastificationType.success,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                        ),
                        child: Text(
                          "ADD TO CART",
                          style: GoogleFonts.sen(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
