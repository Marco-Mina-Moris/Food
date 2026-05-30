part of 'category_meals_cubit.dart';

@immutable
sealed class CategoryMealsState {}

final class CategoryMealsInitial extends CategoryMealsState {}

final class CategoryMealsLoading extends CategoryMealsState {}

final class CategoryMealsSuccess extends CategoryMealsState {}

final class CategoryMealsError extends CategoryMealsState {
  final String messageError;

  CategoryMealsError(this.messageError);
}
