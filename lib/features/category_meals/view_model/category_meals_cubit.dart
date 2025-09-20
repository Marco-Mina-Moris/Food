import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/app_apis.dart';
import '../model/meal.dart';

part 'category_meals_state.dart';

class CategoryMealsCubit extends Cubit<CategoryMealsState> {
  CategoryMealsCubit() : super(CategoryMealsInitial());

  // List<MealResponse> categoriesMeals = [];
  //
  // Future<void> getCategoriesMeals() async {
  //   //Loading
  //   emit(CategoryMealsLoading());
  //   try {
  //     //Success
  //     final response =
  //         await HomeApi.getMealsByCategory(); // ده بيرجع CategoryResponse2
  //     categoriesMeals = response.categories ?? [];
  //     emit(CategoryMealsSuccess());
  //   } catch (e) {
  //     emit(CategoryMealsError("Something went wrong"));
  //   }
  // }
  List<Meal> categoriesMeals = [];

  Future<void> getCategoriesMeals(String categoryName) async {
    emit(CategoryMealsLoading());
    try {
      final response = await HomeApi.getMealsByCategory(categoryName);
      categoriesMeals = response.meals ?? [];
      emit(CategoryMealsSuccess());
    } catch (e) {
      emit(CategoryMealsError("Something went wrong: $e"));
    }
  }
}
