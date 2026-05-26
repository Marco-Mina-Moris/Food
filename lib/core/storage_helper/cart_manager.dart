import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartManager {
  static const String _cartKey = 'cart_items';

  // Get list of cart items
  static Future<List<Map<String, dynamic>>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartJson = prefs.getString(_cartKey);
    if (cartJson == null) {
      return [];
    }
    try {
      final List<dynamic> decoded = jsonDecode(cartJson);
      return decoded.map((item) => Map<String, dynamic>.from(item)).toList();
    } catch (e) {
      return [];
    }
  }

  // Add item to cart
  static Future<void> addToCart(Map<String, dynamic> item) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cartItems = await getCartItems();
    
    final idMeal = item['idMeal'];
    final size = item['size'];
    final quantity = item['quantity'] ?? 1;

    // Find if item with same id and size exists
    final int index = cartItems.indexWhere(
      (cartItem) => cartItem['idMeal'] == idMeal && cartItem['size'] == size,
    );

    if (index >= 0) {
      // Increment quantity
      cartItems[index]['quantity'] = (cartItems[index]['quantity'] ?? 1) + quantity;
    } else {
      // Add new item
      cartItems.add(item);
    }

    await prefs.setString(_cartKey, jsonEncode(cartItems));
  }

  // Remove item from cart
  static Future<void> removeFromCart(String idMeal, String size) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cartItems = await getCartItems();
    
    cartItems.removeWhere(
      (item) => item['idMeal'] == idMeal && item['size'] == size,
    );

    await prefs.setString(_cartKey, jsonEncode(cartItems));
  }

  // Update quantity of an item in cart
  static Future<void> updateQuantity(String idMeal, String size, int quantity) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cartItems = await getCartItems();
    
    final int index = cartItems.indexWhere(
      (item) => item['idMeal'] == idMeal && item['size'] == size,
    );

    if (index >= 0) {
      cartItems[index]['quantity'] = quantity;
      await prefs.setString(_cartKey, jsonEncode(cartItems));
    }
  }

  // Clear cart
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
