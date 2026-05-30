import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/user/home/view_model/home_cubit.dart';
import 'package:food/features/user/favorite/view/screens/favorite_screen.dart';
import 'package:food/features/user/favorite/view_model/favorite_cubit.dart';
import '../home/view/screens/home_screen.dart';
import '../my_orders/presentation/views/my_orders_view.dart';
import '../profile/presentation/views/profile_view.dart';

class AppSection extends StatefulWidget {
  AppSection({super.key});

  static final ValueNotifier<int> activeTabNotifier = ValueNotifier<int>(0);

  @override
  State<AppSection> createState() => _AppSection();
}

class _AppSection extends State<AppSection> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getCategories(),
      child: HomeScreen(),
    ),
    const MyOrdersView(),
    BlocProvider<FavoriteCubit>(
      create: (context) => FavoriteCubit(),
      child: const FavoriteScreen(),
    ),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = AppSection.activeTabNotifier.value;
    AppSection.activeTabNotifier.addListener(_onActiveTabChanged);
  }

  @override
  void dispose() {
    AppSection.activeTabNotifier.removeListener(_onActiveTabChanged);
    super.dispose();
  }

  void _onActiveTabChanged() {
    if (mounted) {
      setState(() {
        _selectedIndex = AppSection.activeTabNotifier.value;
      });
    }
  }

  void _onItemTapped(int index) {
    AppSection.activeTabNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Enables transparency behind the floating navigation bar
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: SafeArea(
          child: Container(
            height: 66,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            decoration: BoxDecoration(
              color: AppColors.veryDarkBlue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_rounded, "Home"),
                _buildNavItem(1, Icons.shopping_bag_rounded, "Orders"),
                _buildNavItem(2, Icons.favorite_rounded, "Favorites"),
                _buildNavItem(3, Icons.person_rounded, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  icon,
                  color: isSelected ? AppColors.orange : AppColors.lightSteelBlue,
                  size: 26,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: isSelected ? 6 : 0,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
