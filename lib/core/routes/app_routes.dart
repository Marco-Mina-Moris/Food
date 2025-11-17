import 'package:flutter/material.dart';
import 'package:food/feature/auth/view/screens/forgot_password_view.dart';
import 'package:food/feature/auth/view/screens/permission_screen_view.dart';
import 'package:food/feature/auth/view/screens/sign_up_screen_view.dart';
import 'package:food/feature/onboarding/onboarding_screen.dart';
import 'package:food/features/auth/view/screens/login_screen_view.dart';
import 'package:food/features/splash/splash_screen.dart';

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
  static const String restaurant = '/restaurant';
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
      // Auth Routes
      case splash:
        return _createRoute(const SplashScreen());
      case onboarding:
        return _createSlideRoute(const OnboardingScreen());
      case login:
        return _createRoute(LoginScreen());
      case signup:
        return _createRoute(SignUpScreen());
      case forgotPassword:
        return _createRoute( ForgotPasswordScreen());
      // case verification:
      //   return _createRoute(const VerificationScreen());
      case resetPassword:
        return _createRoute(const PermissionScreen());

      // Home Routes
      case homeV1:
      // return _createFadeRoute(const HomeV1Screen());
      case homeV2:
      // return _createFadeRoute(const HomeV2Screen());
      case homeV3:
      // return _createFadeRoute(const HomeV3Screen());
      case search:
      // return _createRoute(const SearchScreen());

      // Food & Restaurant Routes
      case foodDetails:
      // return _createSlideRoute(
      //   FoodDetailsScreen(foodId: arguments as String? ?? ''),
      // );
      case restaurant:
      // return _createRoute(
      //   RestaurantScreen(restaurantId: arguments as String? ?? ''),
      // );
      case filter:
      // return _createSlideRoute(const FilterScreen());
      case offer:
      // return _createRoute(const OfferScreen());

      // Order Flow Routes
      case cart:
      // return _createSlideRoute(const CartScreen());
      case checkout:
      // return _createRoute(const CheckoutScreen());
      case payment:
      // return _createRoute(const PaymentScreen());
      case addCard:
      // return _createSlideRoute(const AddCardScreen());
      case paymentSuccess:
      // return _createFadeRoute(const PaymentSuccessScreen());
      case deliveryTracking:
      // return _createRoute(
      //   DeliveryTrackingScreen(orderId: arguments as String? ?? ''),
      // );

      // User Profile Routes
      case myOrders:
      // return _createRoute(const MyOrdersScreen());
      case orderDetails:
      // return _createRoute(
      //   OrderDetailsScreen(orderId: arguments as String? ?? ''),
      // );
      case menu:
      // return _createRoute(const MenuScreen());
      case profile:
      // return _createRoute(const ProfileScreen());
      case editProfile:
      // return _createRoute(const EditProfileScreen());
      case address:
      // return _createRoute(const AddressScreen());
      case addNewAddress:
      // return _createSlideRoute(const AddNewAddressScreen());

      // Chef Routes
      case chefDashboard:
      // return _createFadeRoute(const ChefDashboardScreen());
      case chefOrders:
      // return _createRoute(const ChefOrdersScreen());
      case myFood:
      // return _createRoute(const MyFoodScreen());
      case addMenu:
      // return _createSlideRoute(const AddMenuScreen());
      case chefProfile:
      // return _createRoute(const ChefProfileScreen());
      case menuManagement:
      // return _createRoute(const MenuManagementScreen());
      case paymentHistory:
      // return _createRoute(const PaymentHistoryScreen());
      case notifications:
      // return _createRoute(const NotificationsScreen());
      case analytics:
      // return _createRoute(const AnalyticsScreen());
      case reviews:
      // return _createRoute(const ReviewsScreen());

      // 404 Route
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

  // Navigation Helper Methods

  // User Navigation
  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homeV1);
  }

  static void navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, login);
  }

  static void navigateToFoodDetails(BuildContext context, String foodId) {
    Navigator.pushNamed(context, foodDetails, arguments: foodId);
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

  static void navigateToDeliveryTracking(BuildContext context, String orderId) {
    Navigator.pushNamed(context, deliveryTracking, arguments: orderId);
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
