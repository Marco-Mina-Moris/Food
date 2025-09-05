import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: AppTextStyle.sen700Style14,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2, color: AppColors.orange),
        insets: EdgeInsets.symmetric(horizontal: 100),
      ),
      controller: _tabController,
      indicatorColor: AppColors.orange,
      labelColor: AppColors.orange,
      unselectedLabelColor: AppColors.gray,

      tabs: const [Tab(text: 'Ongoing'), Tab(text: 'History')],
    );
  }
}
