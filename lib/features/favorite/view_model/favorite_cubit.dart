import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:food/core/storage_helper/favorites_manager.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<Map<String, dynamic>> favorites = [];

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      favorites = await FavoritesManager.getFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError("Failed to load favorites"));
    }
  }

  Future<void> removeFavorite(String idMeal) async {
    try {
      // Toggle favorite returns false if removed, which it should be here.
      await FavoritesManager.toggleFavorite(
        idMeal: idMeal,
        strMeal: '',
        strMealThumb: '',
      );
      favorites = await FavoritesManager.getFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError("Failed to remove favorite"));
    }
  }
}
