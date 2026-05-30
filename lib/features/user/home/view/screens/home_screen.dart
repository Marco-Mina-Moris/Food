import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/constants/app_apis.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/user/home/view/screens/recipe_details_screen.dart';
import 'package:food/features/user/home/view/widgets/build_category.dart';
import 'package:food/features/user/home/view_model/home_cubit.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_cubit.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_state.dart';
import 'package:animate_do/animate_do.dart';

import 'package:food/core/storage_helper/cart_manager.dart';
import '../../model/response/restaurants_response.dart';
import 'package:food/features/user/home/view/widgets/home_skeletons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RestaurantMenuResponse> _recipesFuture;

  @override
  void initState() {
    super.initState();
    CartManager.updateCartCount();
    _recipesFuture = HomeApi.getRecipes(limit: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const SizedBox(height: 16),
              // App Bar Section
              Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Navigator.pushNamed(context, '/address');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DELIVER TO",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Halal Lab office",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.orange,
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ValueListenableBuilder<int>(
                    valueListenable: CartManager.cartCountNotifier,
                    builder: (context, count, child) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/cart').then((_) {
                            CartManager.updateCartCount();
                          });
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.darkBlue,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.darkBlue.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            if (count > 0)
                              Positioned(
                                right: -4,
                                top: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$count',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Greeting Section
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  String name = "User";
                  if (state is ProfileLoaded) {
                    name = state.user.name ?? "User";
                  } else if (state is ProfileUpdateSuccess) {
                    name = state.user.name ?? "User";
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey $name,",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.darkGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Discover delicious food!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkBlue,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              // Search Bar Section
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.paleBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search dishes, restaurants...",
                          hintStyle: TextStyle(color: AppColors.lightSteelBlue),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: AppColors.lightSteelBlue,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                        ),
                        onChanged: (value) {
                          // TODO: implement search
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.orange.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.tune_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Categories Title Section
              Row(
                children: [
                  Text(
                    "All Categories",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Handle see all
                    },
                    child: Row(
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.orange,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Categories List
              SizedBox(
                height: 210,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const CategoryListSkeleton();
                    }
                    if (state is HomeError) {
                      return Center(
                        child: Text(
                          state.messageError,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    final categories = context.read<HomeCubit>().categories;
                    if (categories.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category_outlined, size: 48, color: AppColors.lightSteelBlue),
                            const SizedBox(height: 8),
                            Text(
                              "No categories found",
                              style: TextStyle(color: AppColors.darkGray, fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    }
                    return FadeIn(
                      duration: const Duration(milliseconds: 600),
                      child: BuildCategory(categories: categories),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Open Restaurants Title Section
              Row(
                children: [
                  Text(
                    "Open Restaurants",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Handle see all
                    },
                    child: Row(
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.orange,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Restaurants List
              FutureBuilder<RestaurantMenuResponse>(
                future: _recipesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const RestaurantListSkeleton();
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline_rounded, size: 48, color: Colors.red[300]),
                          const SizedBox(height: 12),
                          Text(
                            "Failed to load restaurants",
                            style: TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _recipesFuture = HomeApi.getRecipes(limit: 10);
                              });
                            },
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.recipes == null ||
                      snapshot.data!.recipes!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.restaurant_outlined, size: 48, color: AppColors.lightSteelBlue),
                          const SizedBox(height: 8),
                          Text(
                            "No recipes found",
                            style: TextStyle(color: AppColors.darkGray, fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }

                  final recipes = snapshot.data!.recipes!;

                  return ListView.builder(
                    itemCount: recipes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 90), // Spacing for floating Bottom Nav Bar
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return FadeInUp(
                          duration: Duration(milliseconds: 300 + (index * 100)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => RecipeDetailsScreen(recipe: recipe),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppColors.paleBlue,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      recipe.image ??
                                          "https://via.placeholder.com/150",
                                      height: 160,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recipe.name ?? "Unknown",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkBlue,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          recipe.cuisine ?? "Not specified",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: AppColors.darkGray,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        // Icons details line
                                        Row(
                                          children: [
                                            // Rating Badge
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.amber.withOpacity(0.12),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "${recipe.rating ?? 0.0}",
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            // Free Delivery Badge
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: AppColors.green.withOpacity(0.12),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.local_shipping_outlined,
                                                    color: AppColors.green,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "Free",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                      color: AppColors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            // Timer Badge
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: AppColors.darkGray.withOpacity(0.12),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time_rounded,
                                                    color: AppColors.darkGray,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "${(recipe.prepTimeMinutes ?? 0) + (recipe.cookTimeMinutes ?? 0)} min",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                      color: AppColors.darkGray,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
