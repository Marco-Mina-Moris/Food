import 'package:flutter/material.dart';
import 'package:food/core/constants/app_apis.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/home/view/screens/recipe_details_screen.dart';

import '../../../category_meals/view/screens/category_meals_screen.dart';
import '../../model/response/category2_response.dart';
import '../../model/response/restaurants_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.iceGray,
                    radius: 25,
                    child: Icon(Icons.menu),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deliver to",
                        style: TextStyle(color: AppColors.orange),
                      ),
                      Text("Halal Lab office"),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                    backgroundColor: AppColors.darkBackground,
                    radius: 25,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Hey Halal, Good Afternoon!",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search dishes, restaurants",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.gray,
                  // اللون اللي قلت عليه
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  // هنا تحط لوجيك البحث
                  print("Searching for: $value");
                },
              ),
              SizedBox(height: 15),
              Row(
                children: [Text("All Categories"), Spacer(), Text("See All")],
              ),
              SizedBox(height: 15),

              SizedBox(
                height: 220,
                child: FutureBuilder<CategoryResponse2>(
                  future: HomeApi.getCategories2(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }
                    if (!snapshot.hasData ||
                        snapshot.data!.categories == null ||
                        snapshot.data!.categories!.isEmpty) {
                      return const Center(child: Text("No categories found"));
                    }

                    final categories = snapshot.data!.categories!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => CategoryMealsScreen(
                                      categoryName:
                                          category.strCategory ?? "Unknown",
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Image.network(
                                    category.strCategoryThumb ??
                                        "https://img.icons8.com/color/96/question-mark.png",
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        category.strCategory ?? "No Name",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        category.strCategoryDescription ??
                                            "No Description",
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 20),
              Row(
                children: [Text("Open Restaurants"), Spacer(), Text("See All")],
              ),
              SizedBox(height: 20),

              Expanded(
                child: FutureBuilder<RestaurantMenuResponse>(
                  future: HomeApi.getRecipes(limit: 10),
                  // بترجع RestaurantMenuResponse
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }

                    if (!snapshot.hasData ||
                        snapshot.data!.recipes == null ||
                        snapshot.data!.recipes!.isEmpty) {
                      return const Center(child: Text("No recipes found"));
                    }

                    final recipes = snapshot.data!.recipes!;

                    return ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return GestureDetector(
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
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.darkBackground,
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
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
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recipe.name ?? "Unknown",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkBackground,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        recipe.cuisine ?? "Not specified",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      const SizedBox(height: 8),

                                      // ⭐ هنا هنضيف الريت والوقت
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 4),
                                          Text("${recipe.rating ?? 0.0}"),

                                          const SizedBox(width: 16),
                                          const Icon(
                                            Icons.local_shipping,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 4),
                                          const Text("Free"),
                                          const SizedBox(width: 16),
                                          Icon(
                                            Icons.timer,
                                            color: Colors.grey,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "${(recipe.prepTimeMinutes ?? 0) + (recipe.cookTimeMinutes ?? 0)} min",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
