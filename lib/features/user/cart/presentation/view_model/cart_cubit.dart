import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:food/core/storage_helper/cart_manager.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<Map<String, dynamic>> cartItems = [];

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      cartItems = await CartManager.getCartItems();
      final total = _calculateTotal(cartItems);
      emit(CartLoaded(cartItems: cartItems, totalPrice: total));
    } catch (e) {
      emit(CartError("Failed to load cart items"));
    }
  }

  Future<void> addItem(Map<String, dynamic> item) async {
    try {
      await CartManager.addToCart(item);
      await loadCart();
    } catch (e) {
      emit(CartError("Failed to add item to cart"));
    }
  }

  Future<void> updateItemQty(String idMeal, String size, int qty) async {
    try {
      await CartManager.updateQuantity(idMeal, size, qty);
      await loadCart();
    } catch (e) {
      emit(CartError("Failed to update item quantity"));
    }
  }

  Future<void> removeItem(String idMeal, String size) async {
    try {
      await CartManager.removeFromCart(idMeal, size);
      await loadCart();
    } catch (e) {
      emit(CartError("Failed to remove item from cart"));
    }
  }

  Future<void> clearCart() async {
    try {
      await CartManager.clearCart();
      await loadCart();
    } catch (e) {
      emit(CartError("Failed to clear cart"));
    }
  }

  double _calculateTotal(List<Map<String, dynamic>> items) {
    double total = 0;
    for (var item in items) {
      final price = (item['price'] as num?)?.toDouble() ?? 0.0;
      final quantity = (item['quantity'] as num?)?.toInt() ?? 1;
      total += price * quantity;
    }
    return total;
  }
}
