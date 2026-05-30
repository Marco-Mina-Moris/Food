import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/chef/view/screens/tabs/chef_dashboard_tab.dart';
import 'package:food/features/chef/view/screens/tabs/chef_menu_tab.dart';
import 'package:food/features/chef/view/screens/tabs/chef_orders_tab.dart';
import 'package:food/features/chef/view/screens/tabs/chef_profile_tab.dart';

class ChefSection extends StatefulWidget {
  const ChefSection({super.key});

  static final ValueNotifier<int> activeTabNotifier = ValueNotifier<int>(0);

  @override
  State<ChefSection> createState() => _ChefSectionState();
}

class _ChefSectionState extends State<ChefSection> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ChefDashboardTab(),
    const ChefOrdersTab(),
    const ChefMenuTab(),
    const ChefProfileTab(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = ChefSection.activeTabNotifier.value;
    ChefSection.activeTabNotifier.addListener(_onActiveTabChanged);
  }

  @override
  void dispose() {
    ChefSection.activeTabNotifier.removeListener(_onActiveTabChanged);
    super.dispose();
  }

  void _onActiveTabChanged() {
    if (mounted) {
      setState(() {
        _selectedIndex = ChefSection.activeTabNotifier.value;
      });
    }
  }

  void _onItemTapped(int index) {
    ChefSection.activeTabNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 72,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          decoration: BoxDecoration(
            color: AppColors.veryDarkBlue,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.dashboard_rounded, "Dashboard"),
              _buildNavItem(1, Icons.receipt_long_rounded, "Orders"),
              _buildNavItem(2, Icons.restaurant_menu_rounded, "Menu"),
              _buildNavItem(3, Icons.storefront_rounded, "Kitchen"),
            ],
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.orange.withOpacity(0.15) : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: AnimatedScale(
                scale: isSelected ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  icon,
                  color: isSelected ? AppColors.orange : AppColors.lightSteelBlue,
                  size: 26,
                ),
              ),
            ),
            const SizedBox(height: 2),
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
    );
  }
}
