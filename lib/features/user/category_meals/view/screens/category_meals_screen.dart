import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/user/category_meals/view_model/category_meals_cubit.dart';
import 'package:food/features/user/category_meals/view/widgets/category_meals_skeletons.dart';
import 'package:food/features/user/category_meals/view/widgets/category_meals_widgets.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryName;

  const CategoryMealsScreen({super.key, required this.categoryName});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final cubit = context.read<CategoryMealsCubit>();
    // Start loading more 250px before the end
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 250) {
      cubit.loadMoreMeals();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom premium App Bar header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.paleBlue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.darkBlue,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CATEGORY",
                        style: TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        widget.categoryName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Main body view
            Expanded(
              child: BlocBuilder<CategoryMealsCubit, CategoryMealsState>(
                builder: (context, state) {
                  // Loading skeleton grid
                  if (state is CategoryMealsLoading) {
                    return const MealGridSkeleton();
                  }

                  // Error page with retry action
                  if (state is CategoryMealsError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline_rounded, size: 54, color: Colors.red[300]),
                          const SizedBox(height: 16),
                          Text(
                            "Failed to load meals",
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.messageError,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.darkGray, fontSize: 13),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            onPressed: () {
                              context.read<CategoryMealsCubit>().getCategoriesMeals(widget.categoryName);
                            },
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }

                  // Success State (Paginating Grid)
                  if (state is CategoryMealsSuccess) {
                    final meals = state.meals;
                    final isLoadingMore = state.isLoadingMore;

                    // Empty category fallback
                    if (meals.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restaurant_menu_rounded, size: 54, color: AppColors.lightSteelBlue),
                            const SizedBox(height: 12),
                            Text(
                              "No meals found for this category",
                              style: TextStyle(
                                color: AppColors.darkGray,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          sliver: SliverGrid(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.72,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final meal = meals[index];
                                return MealCard(meal: meal);
                              },
                              childCount: meals.length,
                            ),
                          ),
                        ),
                        // Loading more spinner at the bottom
                        if (isLoadingMore)
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.orange,
                                  strokeWidth: 3,
                                ),
                              ),
                            ),
                          ),
                        // Standard safe bottom spacer
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 24),
                        ),
                      ],
                    );
                  }

                  // Default Fallback
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
