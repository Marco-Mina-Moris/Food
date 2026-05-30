import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/user/app_section/app_section.dart';
import 'package:food/features/auth/viewmodel/auth_cubit.dart';
import 'package:food/features/auth/view/screens/forgot_password_view.dart';
import 'package:food/features/auth/view/screens/login_screen_view.dart';
import 'package:food/features/auth/view/screens/permission_screen_view.dart';
import 'package:food/features/auth/view/screens/sign_up_screen_view.dart';
import 'package:food/features/auth/view/screens/verificaton_screen_view.dart';
import 'package:food/features/user/cart/presentation/views/my_cart_view.dart';
import 'package:food/features/user/cart/presentation/view_model/cart_cubit.dart';
import 'package:food/features/user/category_meals/view/screens/category_meals_screen.dart';
import 'package:food/features/user/category_meals/view_model/category_meals_cubit.dart';
import 'package:food/features/user/food_burgers/view/screens/food_burgers.dart';
import 'package:food/features/user/food_details/view/screens/food_details.dart';
import 'package:food/features/user/meal_details/view/screens/meal_details_screen.dart';
import 'package:food/features/user/meal_details/view_model/model_detail_cubit.dart';
import 'package:food/features/user/my_orders/presentation/views/my_orders_view.dart';
import 'package:food/features/user/onboarding/onboarding_screen.dart';
import 'package:food/features/user/payment/presentation/views/add_new_card_view.dart';
import 'package:food/features/user/payment/presentation/views/congratulation_view.dart';
import 'package:food/features/user/payment/presentation/views/payment_view.dart';
import 'package:food/features/user/profile/presentation/views/add_new_address_view.dart';
import 'package:food/features/user/profile/presentation/views/address_view.dart';
import 'package:food/features/user/profile/presentation/views/edit_profile_view.dart';
import 'package:food/features/user/profile/presentation/views/profile_view.dart';
import 'package:food/features/user/restaurant_view/view/screens/restaurant_view.dart';
import 'package:food/features/splash/splash_screen.dart';
import 'package:food/features/user/tracking_order/presentation/views/tracking_order_view.dart';
import 'package:food/features/user/tracking_order/presentation/view_model/tracking_order_cubit.dart';

import 'package:food/features/chef/view/screens/chef_section.dart';
import 'package:food/features/chef/view/screens/add_menu_screen.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';

class AppRoutes {
  // User Routes
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String verification = '/verification';
  static const String resetPassword = '/permission';

  // Home Routes
  static const String homeV1 = '/home-v1';
  static const String homeV2 = '/home-v2';
  static const String homeV3 = '/home-v3';
  static const String search = '/search';

  // Food & Restaurant Routes
  static const String foodDetails = '/food-details';
  static const String foodBurgers = '/food-burgers';
  static const String restaurant = '/restaurant';
  static const String categoryMeals = '/category-meals';
  static const String mealDetails = '/meal-details';
  static const String filter = '/filter';
  static const String offer = '/offer';

  // Order Flow Routes
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String payment = '/payment';
  static const String addCard = '/add-card';
  static const String paymentSuccess = '/payment-success';
  static const String deliveryTracking = '/delivery-tracking';

  // User Profile Routes
  static const String myOrders = '/my-orders';
  static const String orderDetails = '/order-details';
  static const String menu = '/menu';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String address = '/address';
  static const String addNewAddress = '/add-new-address';

  // Chef Routes
  static const String chefDashboard = '/chef/dashboard';
  static const String chefOrders = '/chef/orders';
  static const String myFood = '/chef/my-food';
  static const String addMenu = '/chef/add-menu';
  static const String chefProfile = '/chef/profile';
  static const String menuManagement = '/chef/menu-management';
  static const String paymentHistory = '/chef/payment-history';
  static const String notifications = '/chef/notifications';
  static const String analytics = '/chef/analytics';
  static const String reviews = '/chef/reviews';

  // Route Generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      // ==================== Auth Routes ====================
      case splash:
        return _createRoute(const SplashScreen());
      case onboarding:
        return _createSlideRoute(const OnboardingScreen());
      case login:
        return _createRoute(
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case signup:
        return _createRoute(
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
            child: SignUpScreen(),
          ),
        );
      case forgotPassword:
        return _createRoute(
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
            child: ForgotPasswordScreen(),
          ),
        );
      case verification:
        return _createRoute(const VerificationScreen());
      case resetPassword:
        return _createRoute(const PermissionScreen());

      // ==================== Home Routes ====================
      case homeV1:
        return _createFadeRoute(AppSection());

      // ==================== Food & Restaurant Routes ====================
      case foodDetails:
        return _createSlideRoute(FoodDetails());
      case foodBurgers:
        return _createSlideRoute(FoodBurgers());
      case restaurant:
        return _createSlideRoute(const RestaurantView());
      case categoryMeals:
        final categoryName = arguments as String? ?? 'Category';
        return _createSlideRoute(
          BlocProvider<CategoryMealsCubit>(
            create: (context) => CategoryMealsCubit()..getCategoriesMeals(categoryName),
            child: CategoryMealsScreen(categoryName: categoryName),
          ),
        );
      case mealDetails:
        final mealId = arguments as String? ?? '';
        return _createSlideRoute(
          BlocProvider<ModelDetailCubit>(
            create: (context) => ModelDetailCubit()..getModelDetail(mealId),
            child: MealDetailsScreen(mealId: mealId),
          ),
        );

      // ==================== Order Flow Routes ====================
      case cart:
        return _createSlideRoute(
          BlocProvider<CartCubit>(
            create: (context) => CartCubit()..loadCart(),
            child: const MyCartView(),
          ),
        );
      case checkout:
        return _createRoute(const MyOrdersView());
      case payment:
        final price = arguments as double? ?? 0.0;
        return _createRoute(PaymentView(totalPrice: price));
      case addCard:
        return _createSlideRoute(const AddNewCardView());
      case paymentSuccess:
        return _createFadeRoute(const CongratulationView());
      case deliveryTracking:
        return _createRoute(
          BlocProvider<TrackingOrderCubit>(
            create: (context) => TrackingOrderCubit()..loadTrackingInfo(),
            child: const TrackingOrderView(),
          ),
        );

      // ==================== User Profile Routes ====================
      case myOrders:
        return _createRoute(const MyOrdersView());
      case profile:
        return _createRoute(const ProfileView());
      case editProfile:
        return _createRoute(const EditProfileView());
      case address:
        return _createRoute(const AddressView());
      case addNewAddress:
        return _createSlideRoute(const AddNewAddressView());

      // ==================== Chef Routes ====================
      case chefDashboard:
        return _createFadeRoute(
          BlocProvider<ChefCubit>(
            create: (context) => ChefCubit()..loadChefData(),
            child: const ChefSection(),
          ),
        );
      case addMenu:
        final chefCubit = arguments as ChefCubit;
        return _createSlideRoute(
          BlocProvider<ChefCubit>.value(
            value: chefCubit,
            child: const AddMenuScreen(),
          ),
        );

      // ==================== 404 Route ====================
      default:
        return _createRoute(
          Scaffold(
            appBar: AppBar(
              title: const Text('  Page Not Found'),
              backgroundColor: Colors.orange,
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_menu, size: 100, color: Colors.orange),
                  SizedBox(height: 20),
                  Text(
                    '404 - Page Not Found',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Page not found. Please check the URL or return to the home page.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }

  // Custom Route Transitions
  static Route _createRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  static Route _createSlideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static Route _createFadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  // ==================== Navigation Helper Methods ====================

  // User Navigation
  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homeV1);
  }

  static void navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, login);
  }

  static void navigateToFoodDetails(BuildContext context) {
    Navigator.pushNamed(context, foodDetails);
  }

  static void navigateToRestaurant(BuildContext context) {
    Navigator.pushNamed(context, restaurant);
  }

  static void navigateToCategoryMeals(BuildContext context, String categoryName) {
    Navigator.pushNamed(context, categoryMeals, arguments: categoryName);
  }

  static void navigateToMealDetails(BuildContext context, String mealId) {
    Navigator.pushNamed(context, mealDetails, arguments: mealId);
  }

  static void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, cart);
  }

  static void navigateToCheckout(BuildContext context) {
    Navigator.pushNamed(context, checkout);
  }

  static void navigateToPayment(BuildContext context) {
    Navigator.pushNamed(context, payment);
  }

  static void navigateToDeliveryTracking(BuildContext context) {
    Navigator.pushNamed(context, deliveryTracking);
  }

  // Chef Navigation
  static void navigateToChefDashboard(BuildContext context) {
    Navigator.pushReplacementNamed(context, chefDashboard);
  }

  static void navigateToAddMenu(BuildContext context) {
    Navigator.pushNamed(context, addMenu);
  }

  // General Navigation
  static void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void clearAndNavigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, homeV1, (route) => false);
  }

  static void clearAndNavigateToChefDashboard(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, chefDashboard, (route) => false);
  }
}
