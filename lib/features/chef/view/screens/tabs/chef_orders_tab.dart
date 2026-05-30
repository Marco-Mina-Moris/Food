import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/chef/model/chef_models.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';
import 'package:food/features/chef/view/widgets/chef_order_card.dart';

class ChefOrdersTab extends StatefulWidget {
  const ChefOrdersTab({super.key});

  @override
  State<ChefOrdersTab> createState() => _ChefOrdersTabState();
}

class _ChefOrdersTabState extends State<ChefOrdersTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Orders Queue",
          style: TextStyle(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.lightgray,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.darkGray,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              tabs: const [
                Tab(text: "Pending"),
                Tab(text: "Preparing"),
                Tab(text: "Completed"),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<ChefCubit, ChefState>(
        builder: (context, state) {
          final orders = context.read<ChefCubit>().orders;
          return TabBarView(
            controller: _tabController,
            children: [
              _buildOrdersList(context, orders, "Pending"),
              _buildOrdersList(context, orders, "Preparing"),
              _buildOrdersList(context, orders, "Completed"),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, List<ChefOrder> allOrders, String statusFilter) {
    final filteredOrders = allOrders.where((order) => order.status == statusFilter).toList();

    if (filteredOrders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              statusFilter == "Pending"
                  ? Icons.receipt_long_rounded
                  : statusFilter == "Preparing"
                      ? Icons.soup_kitchen_rounded
                      : Icons.task_alt_rounded,
              size: 80,
              color: AppColors.lavenderGray,
            ),
            const SizedBox(height: 16),
            Text(
              "No orders in $statusFilter status",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGray,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "New orders will show up here.",
              style: TextStyle(
                fontSize: 13,
                color: AppColors.lightSteelBlue,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
      itemCount: filteredOrders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return ChefOrderCard(order: order, showActions: true);
      },
    );
  }
}
