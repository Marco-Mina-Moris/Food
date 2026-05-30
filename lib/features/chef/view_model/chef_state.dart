part of 'chef_cubit.dart';

@immutable
sealed class ChefState {}

final class ChefInitial extends ChefState {}

final class ChefLoading extends ChefState {}

final class ChefSuccess extends ChefState {}

final class ChefError extends ChefState {
  final String message;

  ChefError(this.message);
}
