import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/view_model/home_cubit.dart';

import '../favorite/favorite_screen.dart';
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
    const FavoriteScreen(),
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
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
