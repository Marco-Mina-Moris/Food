import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../model/chef_models.dart';

part 'chef_state.dart';

class ChefCubit extends Cubit<ChefState> {
  ChefCubit() : super(ChefInitial());

  List<ChefMeal> meals = [
    ChefMeal(
      id: "1",
      name: "Classic Beef Burger",
      price: 8.99,
      category: "Burgers",
      description: "Juicy flame-grilled beef patty with cheese, fresh lettuce, and tomato.",
      image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80",
    ),
    ChefMeal(
      id: "2",
      name: "BBQ Chicken Pizza",
      price: 12.49,
      category: "Pizza",
      description: "BBQ sauce base, grilled chicken, sliced red onions, and fresh cilantro.",
      image: "https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=500&q=80",
    ),
    ChefMeal(
      id: "3",
      name: "Choco Fudge Waffle",
      price: 6.99,
      category: "Desserts",
      description: "Warm Belgian waffle drizzled with hot fudge and vanilla ice cream.",
      image: "https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?auto=format&fit=crop&w=500&q=80",
    ),
    ChefMeal(
      id: "4",
      name: "Spicy pepperoni Pizza",
      price: 11.99,
      category: "Pizza",
      description: "Mozzarella cheese, spicy pepperoni slices, and italian marinara sauce.",
      image: "https://images.unsplash.com/photo-1628840042765-356cda07504e?auto=format&fit=crop&w=500&q=80",
    ),
  ];

  List<ChefOrder> orders = [
    ChefOrder(
      id: "ORD-9284",
      customerName: "Ahmed Shawky",
      dishes: "2x Classic Beef Burger, 1x Fries",
      totalPrice: 20.97,
      status: "Pending",
      timeAgo: "2 mins ago",
      customerImage: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80",
    ),
    ChefOrder(
      id: "ORD-8712",
      customerName: "Yasmine Nour",
      dishes: "1x BBQ Chicken Pizza, 1x Diet Cola",
      totalPrice: 14.49,
      status: "Preparing",
      timeAgo: "12 mins ago",
      customerImage: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80",
    ),
    ChefOrder(
      id: "ORD-7622",
      customerName: "Omar Aly",
      dishes: "2x Choco Fudge Waffle",
      totalPrice: 13.98,
      status: "Completed",
      timeAgo: "1 hour ago",
      customerImage: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80",
    ),
  ];

  final List<ChefReview> reviews = [
    ChefReview(
      id: "r1",
      userName: "Ahmed Shawky",
      rating: 5.0,
      comment: "The burgers were cooked to absolute perfection! Will order again soon.",
      date: "Today",
    ),
    ChefReview(
      id: "r2",
      userName: "Yasmine Nour",
      rating: 4.5,
      comment: "Delicious pizza, dough was thin and crispy just like I love it.",
      date: "Yesterday",
    ),
    ChefReview(
      id: "r3",
      userName: "Mohamed Hany",
      rating: 5.0,
      comment: "Incredibly fast service, food arrived piping hot and fresh.",
      date: "3 days ago",
    ),
  ];

  void loadChefData() {
    emit(ChefLoading());
    try {
      emit(ChefSuccess());
    } catch (e) {
      emit(ChefError("Failed to load chef dashboard data"));
    }
  }

  void addMeal(ChefMeal meal) {
    emit(ChefLoading());
    try {
      meals.add(meal);
      emit(ChefSuccess());
    } catch (e) {
      emit(ChefError("Failed to add meal"));
    }
  }

  void deleteMeal(String mealId) {
    emit(ChefLoading());
    try {
      meals.removeWhere((item) => item.id == mealId);
      emit(ChefSuccess());
    } catch (e) {
      emit(ChefError("Failed to delete meal"));
    }
  }

  void toggleAvailability(String mealId, bool isAvailable) {
    try {
      final index = meals.indexWhere((item) => item.id == mealId);
      if (index != -1) {
        meals[index].isAvailable = isAvailable;
        emit(ChefSuccess());
      }
    } catch (e) {
      emit(ChefError("Failed to toggle availability"));
    }
  }

  void updateOrderStatus(String orderId, String newStatus) {
    try {
      final index = orders.indexWhere((item) => item.id == orderId);
      if (index != -1) {
        orders[index].status = newStatus;
        emit(ChefSuccess());
      }
    } catch (e) {
      emit(ChefError("Failed to update order status"));
    }
  }

  void declineOrder(String orderId) {
    try {
      orders.removeWhere((item) => item.id == orderId);
      emit(ChefSuccess());
    } catch (e) {
      emit(ChefError("Failed to decline order"));
    }
  }
}
