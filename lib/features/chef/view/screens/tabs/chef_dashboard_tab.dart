import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';
import 'package:food/features/chef/view/screens/chef_section.dart';
import 'package:food/features/chef/view/widgets/chef_kpi_card.dart';
import 'package:food/features/chef/view/widgets/custom_bezier_chart.dart';
import 'package:food/features/chef/view/widgets/chef_order_card.dart';

class ChefDashboardTab extends StatefulWidget {
  const ChefDashboardTab({super.key});

  @override
  State<ChefDashboardTab> createState() => _ChefDashboardTabState();
}

class _ChefDashboardTabState extends State<ChefDashboardTab> {
  bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ChefCubit, ChefState>(
          builder: (context, state) {
            final cubit = context.read<ChefCubit>();
            final meals = cubit.meals;
            final orders = cubit.orders;

            final activeCount = orders.where((o) => o.status != 'Completed').length;
            final totalRevenue = orders
                .where((o) => o.status == 'Completed')
                .fold(0.0, (sum, o) => sum + o.totalPrice);
            final pending = orders.where((o) => o.status != 'Completed').toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.orange, width: 2),
                              image: const DecorationImage(
                                image: NetworkImage("https://images.unsplash.com/photo-1577219491135-ce391730fb2c?auto=format&fit=crop&w=150&q=80"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Chef Marco's Kitchen",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkBlue,
                                ),
                              ),
                              Text(
                                "Restaurant ID: #98381",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.lightSteelBlue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Online Status Switch
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isOnline = !_isOnline;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _isOnline ? "Kitchen is now Open!" : "Kitchen is Closed.",
                              ),
                              backgroundColor: _isOnline ? AppColors.green : AppColors.error,
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _isOnline ? AppColors.green.withOpacity(0.12) : AppColors.error.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _isOnline ? AppColors.green : AppColors.error,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _isOnline ? AppColors.green : AppColors.error,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _isOnline ? "Open" : "Closed",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _isOnline ? AppColors.green : AppColors.error,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Welcome Title
                  Text(
                    "Good Morning, Chef!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Here is your restaurant overview for today.",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // KPI Cards Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.4,
                    children: [
                      ChefKpiCard(
                        label: "Today's Revenue",
                        value: "\$${(totalRevenue + 84.50).toStringAsFixed(2)}",
                        icon: Icons.attach_money_rounded,
                        color: Colors.green,
                      ),
                      ChefKpiCard(
                        label: "Active Orders",
                        value: "$activeCount",
                        icon: Icons.local_shipping_rounded,
                        color: AppColors.orange,
                      ),
                      ChefKpiCard(
                        label: "Total Dishes",
                        value: "${meals.length}",
                        icon: Icons.restaurant_menu_rounded,
                        color: Colors.blue,
                      ),
                      ChefKpiCard(
                        label: "Average Rating",
                        value: "4.8 ★",
                        icon: Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Sales Trends Chart Container
                  Text(
                    "Weekly Sales Trends",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 220,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.veryDarkBlue,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.veryDarkBlue.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Weekly Sales",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white60,
                                  ),
                                ),
                                Text(
                                  "\$1,482.00",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "+15.4%",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 8),
                            child: CustomBezierChart(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Recent Pending Orders Preview
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Active Order Requests",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ChefSection.activeTabNotifier.value = 1; // Switch to Orders tab
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  pending.isEmpty
                      ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppColors.lightgray,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              "No active orders at the moment. Good job!",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pending.length > 2 ? 2 : pending.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final order = pending[index];
                            return ChefOrderCard(order: order, showActions: false);
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
