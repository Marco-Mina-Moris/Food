import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static const String _favoritesKey = 'favorite_meals';

  // Get list of favorites
  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString(_favoritesKey);
    if (favoritesJson == null) {
      return [];
    }
    try {
      final List<dynamic> decoded = jsonDecode(favoritesJson);
      return decoded.map((item) => Map<String, dynamic>.from(item)).toList();
    } catch (e) {
      return [];
    }
  }

  // Toggle favorite status. Returns true if it was added, false if removed.
  static Future<bool> toggleFavorite({
    required String idMeal,
    required String strMeal,
    required String strMealThumb,
    String? strCategory,
    String? strArea,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> favorites = await getFavorites();
    
    final int index = favorites.indexWhere((item) => item['idMeal'] == idMeal);
    bool added = false;
    
    if (index >= 0) {
      favorites.removeAt(index);
    } else {
      favorites.add({
        'idMeal': idMeal,
        'strMeal': strMeal,
        'strMealThumb': strMealThumb,
        'strCategory': strCategory ?? 'Unknown',
        'strArea': strArea ?? 'Unknown',
      });
      added = true;
    }
    
    await prefs.setString(_favoritesKey, jsonEncode(favorites));
    return added;
  }

  // Check if a meal is favorited
  static Future<bool> isFavorite(String idMeal) async {
    final List<Map<String, dynamic>> favorites = await getFavorites();
    return favorites.any((item) => item['idMeal'] == idMeal);
  }
}
