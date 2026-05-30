part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final List<Map<String, dynamic>> favorites;

  FavoriteLoaded(this.favorites);
}

final class FavoriteError extends FavoriteState {
  final String messageError;

  FavoriteError(this.messageError);
}
