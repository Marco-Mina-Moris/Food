import 'package:flutter/material.dart';

import '../../../../core/constants/app_apis.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../category_meals/view/screens/category_meals_screen.dart';
import '../../model/response/category2_response.dart';
import '../../model/response/restaurants_response.dart';
import '../screens/recipe_details_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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

              // FutureBuilder<List<CategoryResponse>>(
              //   future: HomeApi.getCategories(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //
              //     if (snapshot.hasError) {
              //       return Center(child: Text("Error: ${snapshot.error}"));
              //     }
              //
              //     if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //       return Center(child: Text("No categories found"));
              //     }
              //
              //     final categories = snapshot.data!;
              //     return ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: categories.length,
              //       itemBuilder:
              //           (context, index) => Container(
              //             margin: EdgeInsets.only(right: 16),
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20),
              //               border: Border.all(color: Colors.black12, width: 2),
              //             ),
              //
              //             width: 147,
              //
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Center(
              //                     child: Image.network(
              //                       "https://img.icons8.com/color/96/000000/spaghetti.png",
              //                     ),
              //                   ),
              //                   Text("thing"),
              //                   Row(
              //                     children: [
              //                       Text("Text"),
              //                       Spacer(),
              //                       Text("70\$"),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //     );
              //   },
              // ),

              // SizedBox(
              //   height: 220,
              //   child: FutureBuilder<List<CategoryResponse>>(
              //     future: HomeApi.getCategories(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }
              //
              //       if (snapshot.hasError) {
              //         return Center(child: Text("Error: ${snapshot.error}"));
              //       }
              //
              //       if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //         return const Center(child: Text("No categories found"));
              //       }
              //
              //       final categories = snapshot.data!;
              //       return ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: categories.length,
              //         itemBuilder: (context, index) {
              //           final category = categories[index];
              //           return Container(
              //             margin: const EdgeInsets.only(right: 16),
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20),
              //               border: Border.all(color: Colors.black12, width: 2),
              //             ),
              //             width: 160,
              //             child: Padding(
              //               padding: const EdgeInsets.all(12.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Center(
              //                     child: Image.network(
              //                       // لو url مش صورة هنحط placeholder
              //                       categoryImages[category.slug] ??
              //                           "https://img.icons8.com/color/96/question-mark.png",
              //                       height: 100,
              //                       fit: BoxFit.contain,
              //                     ),
              //                   ),
              //                   const SizedBox(height: 8),
              //                   Text(
              //                     category.name ?? "No Name",
              //                     style: const TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 16,
              //                     ),
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   const SizedBox(height: 4),
              //                   Row(
              //                     children: [
              //                       Text(
              //                         category.slug ?? "No Slug",
              //                         style: const TextStyle(
              //                           fontSize: 14,
              //                           color: Colors.grey,
              //                         ),
              //                         overflow: TextOverflow.ellipsis,
              //                       ),
              //                       Spacer(),
              //                       Text(
              //                         "\$70",
              //                         style: const TextStyle(
              //                           fontSize: 20,
              //                           color: Colors.black87,
              //                         ),
              //                         overflow: TextOverflow.ellipsis,
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),

              // SizedBox(
              //   height: 300,
              //   child: FutureBuilder<ProductOfCategory>(
              //     future: HomeApi().getProductsOfCategory("groceries"),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }
              //
              //       if (snapshot.hasError) {
              //         return Center(child: Text("Error: ${snapshot.error}"));
              //       }
              //
              //       if (!snapshot.hasData || snapshot.data!.products == null) {
              //         return const Center(child: Text("No products found"));
              //       }
              //
              //       final products = snapshot.data!.products!;
              //
              //       return ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: products.length,
              //         itemBuilder: (context, index) {
              //           final product = products[index];
              //           return GestureDetector(
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder:
              //                       (_) => CategoryMealsScreen(
              //                         categorySlug: product.category ?? "",
              //                       ),
              //                 ),
              //               );
              //             },
              //             child: Container(
              //               margin: const EdgeInsets.all(8),
              //               width: 180,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(12),
              //                 border: Border.all(color: Colors.black12),
              //               ),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Image.network(
              //                     product.thumbnail ?? "",
              //                     height: 120,
              //                     width: double.infinity,
              //                     fit: BoxFit.cover,
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           product.title ?? "No Title",
              //                           style: const TextStyle(
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                         const SizedBox(height: 4),
              //                         Text(
              //                           product.description ?? "",
              //                           style: const TextStyle(
              //                             fontSize: 12,
              //                             color: Colors.grey,
              //                           ),
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                         const SizedBox(height: 4),
              //                         Text(
              //                           "\$${product.price ?? 0}",
              //                           style: const TextStyle(
              //                             fontSize: 18,
              //                             color: Colors.green,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: 220,
              //   child: FutureBuilder<List<CategoryResponse>>(
              //     future: HomeApi.getCategories(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }
              //
              //       if (snapshot.hasError) {
              //         return Center(child: Text("Error: ${snapshot.error}"));
              //       }
              //
              //       if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //         return const Center(child: Text("No categories found"));
              //       }
              //
              //       final categories = snapshot.data!;
              //       return ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: categories.length,
              //         itemBuilder: (context, index) {
              //           final category = categories[index];
              //           return GestureDetector(
              //             onTap: () {
              //               // لما يضغط يروح على صفحة فيها باقي الأكلات
              //               // Navigator.push(
              //               //   context,
              //               //   MaterialPageRoute(
              //               //     builder:
              //               //         (_) =>
              //               //             CategoryMealsScreen(category: category),
              //               //   ),
              //               // );
              //             },
              //             child: Container(
              //               margin: const EdgeInsets.only(right: 16),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(20),
              //                 border: Border.all(
              //                   color: Colors.black12,
              //                   width: 2,
              //                 ),
              //               ),
              //               width: 160,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(12.0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Center(
              //                       child: Image.network(
              //                         categoryImages[category.slug] ??
              //                             "https://img.icons8.com/color/96/question-mark.png",
              //                         height: 100,
              //                         fit: BoxFit.contain,
              //                       ),
              //                     ),
              //                     const SizedBox(height: 8),
              //                     Text(
              //                       category.name ?? "No Name",
              //                       style: const TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16,
              //                       ),
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                     const SizedBox(height: 4),
              //                     Row(
              //                       children: [
              //                         Text(
              //                           category.slug ?? "No Slug",
              //                           style: const TextStyle(
              //                             fontSize: 14,
              //                             color: Colors.grey,
              //                           ),
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                         const Spacer(),
              //                         const Text(
              //                           "\$70",
              //                           style: TextStyle(
              //                             fontSize: 20,
              //                             color: Colors.black87,
              //                           ),
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: 220,
              //   child: FutureBuilder<CategoryResponse2>(
              //     future: HomeApi.getCategories2(),
              //     // استدعاء الـ API اللي انت عامله
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }
              //
              //       if (snapshot.hasError) {
              //         return Center(child: Text("Error: ${snapshot.error}"));
              //       }
              //
              //       if (!snapshot.hasData ||
              //           snapshot.data!.categories == null ||
              //           snapshot.data!.categories!.isEmpty) {
              //         return const Center(child: Text("No categories found"));
              //       }
              //
              //       final categories = snapshot.data!.categories!;
              //       return ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: categories.length,
              //         itemBuilder: (context, index) {
              //           final category = categories[index];
              //           return GestureDetector(
              //             onTap: () {
              //               // لما يضغط على كاتيجوري → هتفتح شاشة فيها الأكلات بتاعتها
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder:
              //                       (_) => CategoryMealsScreen(
              //                         categoryName:
              //                             category.strCategory ?? "Unknown",
              //                       ),
              //                 ),
              //               );
              //             },
              //             child: Container(
              //               margin: const EdgeInsets.only(right: 16),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(20),
              //                 border: Border.all(
              //                   color: Colors.black12,
              //                   width: 2,
              //                 ),
              //               ),
              //               width: 160,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(12.0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Center(
              //                       child: Image.network(
              //                         category.strCategoryThumb ??
              //                             "https://img.icons8.com/color/96/question-mark.png",
              //                         height: 100,
              //                         fit: BoxFit.contain,
              //                       ),
              //                     ),
              //                     const SizedBox(height: 8),
              //                     Text(
              //                       category.strCategory ?? "No Name",
              //                       style: const TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16,
              //                       ),
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                     const SizedBox(height: 4),
              //                     Text(
              //                       category.strCategoryDescription ??
              //                           "No Description",
              //                       maxLines: 2,
              //                       style: const TextStyle(
              //                         fontSize: 12,
              //                         color: Colors.grey,
              //                       ),
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
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

              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 10,
              //     itemBuilder: (context, index) => Container(
              //       margin: const EdgeInsets.only(bottom: 16),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(16),
              //         border: Border.all(
              //           color: AppColors.darkBackground,
              //           width: 1.5,
              //         ),
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //
              //           ClipRRect(
              //             borderRadius: const BorderRadius.only(
              //               topLeft: Radius.circular(16),
              //               topRight: Radius.circular(16),
              //             ),
              //             child: Image.network(
              //               "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg",
              //               height: 160,
              //               width: double.infinity,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //
              //           Padding(
              //             padding: const EdgeInsets.all(12.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Rose Garden Restaurant",
              //                   style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.bold,
              //                     color: AppColors.darkBackground,
              //                   ),
              //                 ),
              //                 const SizedBox(height: 4),
              //                 Text(
              //                   "Burger • Chicken • Rice • Wings",
              //                   style: TextStyle(
              //                     fontSize: 13,
              //                     color: Colors.grey[700],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Row(
              //                   children: [
              //                     const Icon(Icons.star, color: Colors.orange, size: 18),
              //                     const SizedBox(width: 4),
              //                     const Text("4.7"),
              //                     const SizedBox(width: 16),
              //                     const Icon(Icons.local_shipping, color: Colors.green, size: 18),
              //                     const SizedBox(width: 4),
              //                     const Text("Free"),
              //                     const SizedBox(width: 16),
              //                     const Icon(Icons.access_time, color: Colors.red, size: 18),
              //                     const SizedBox(width: 4),
              //                     const Text("20 min"),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
