import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:food/core/constants/app_apis.dart';
import '../model/meal.dart';

part 'category_meals_state.dart';

class CategoryMealsCubit extends Cubit<CategoryMealsState> {
  CategoryMealsCubit() : super(CategoryMealsInitial());

  List<Meal> _allMeals = [];
  List<Meal> categoriesMeals = [];
  int _currentPage = 1;
  static const int _pageSize = 8;
  bool hasMore = true;
  bool isLoadingMore = false;

  Future<void> getCategoriesMeals(String categoryName) async {
    // Reset all pagination values on category change
    _allMeals = [];
    categoriesMeals = [];
    _currentPage = 1;
    hasMore = true;
    isLoadingMore = false;

    emit(CategoryMealsLoading());
    try {
      final response = await HomeApi.getMealsByCategory(categoryName);
      _allMeals = response.meals ?? [];
      
      hasMore = _allMeals.length > _pageSize;
      
      final end = _allMeals.length > _pageSize ? _pageSize : _allMeals.length;
      categoriesMeals = _allMeals.sublist(0, end);
      
      emit(CategoryMealsSuccess(
        meals: categoriesMeals,
        hasMore: hasMore,
        isLoadingMore: isLoadingMore,
      ));
    } catch (e) {
      emit(CategoryMealsError("Something went wrong: $e"));
    }
  }

  void loadMoreMeals() {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;
    emit(CategoryMealsSuccess(
      meals: categoriesMeals,
      hasMore: hasMore,
      isLoadingMore: isLoadingMore,
    ));

    Future.delayed(const Duration(milliseconds: 500), () {
      _currentPage++;
      final end = _currentPage * _pageSize;

      if (end >= _allMeals.length) {
        categoriesMeals = List.from(_allMeals);
        hasMore = false;
      } else {
        categoriesMeals = _allMeals.sublist(0, end);
        hasMore = true;
      }

      isLoadingMore = false;
      emit(CategoryMealsSuccess(
        meals: categoriesMeals,
        hasMore: hasMore,
        isLoadingMore: isLoadingMore,
      ));
    });
  }
}
