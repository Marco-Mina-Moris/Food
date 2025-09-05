import 'package:flutter/material.dart';
import 'package:food/features/my_orders/presentation/views/widgets/build_history_tab_widget.dart';
import 'package:food/features/my_orders/presentation/views/widgets/build_ongoing_tab_widget.dart';
import 'package:food/features/my_orders/presentation/views/widgets/custom_app_bar_widget.dart';
import 'package:food/features/my_orders/presentation/views/widgets/custom_tab_bar_widget.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBarWidget(),
            SizedBox(height: 24),
            CustomTabBarWidget(tabController: _tabController),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [BuildOngoingTab(), BuildHistoryTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
