import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/category_meals/view/widgets/category_meals_widgets.dart';
import 'package:food/features/category_meals/view_model/category_meals_cubit.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryName;

  const CategoryMealsScreen({super.key, required this.categoryName});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: BlocBuilder<CategoryMealsCubit, CategoryMealsState>(
        builder: (context, state) {
          //Loading
          if (state is CategoryMealsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          //Error
          if (state is CategoryMealsError) {
            return Center(
              child: Text(
                state.messageError ?? "Something went wrong!",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          //Success
          final meals = context.read<CategoryMealsCubit>().categoriesMeals;
          return CategoryMealsWidgets(meals: meals);
        },
      ),
    );
  }
}
