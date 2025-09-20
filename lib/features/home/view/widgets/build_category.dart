import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/model/response/category2_response.dart';

import '../../../category_meals/view/screens/category_meals_screen.dart';
import '../../../category_meals/view_model/category_meals_cubit.dart';

class BuildCategory extends StatefulWidget {
  const BuildCategory({super.key, required this.categories});

  final List<Categories> categories;

  @override
  State<BuildCategory> createState() => _BuildCategoryState();
}

class _BuildCategoryState extends State<BuildCategory> {
  @override
  Widget build(BuildContext context) {
    if (widget.categories.isEmpty) {
      return const Center(child: Text("No categories found"));
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        final category = widget.categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => BlocProvider<CategoryMealsCubit>(
                      create:
                          (context) =>
                              CategoryMealsCubit()..getCategoriesMeals(
                                category.strCategory ?? "Unknown",
                              ),
                      child: CategoryMealsScreen(
                        categoryName: category.strCategory ?? "Unknown",
                      ),
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
                        category.strCategoryDescription ?? "No Description",
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
  }
}
