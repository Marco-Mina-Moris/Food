part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  CartLoaded({required this.cartItems, required this.totalPrice});
}

final class CartError extends CartState {
  final String messageError;

  CartError(this.messageError);
}
