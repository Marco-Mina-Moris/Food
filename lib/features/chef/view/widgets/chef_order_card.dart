import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/chef/model/chef_models.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';

class ChefOrderCard extends StatelessWidget {
  final ChefOrder order;
  final bool showActions;

  const ChefOrderCard({
    super.key,
    required this.order,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (order.status == 'Pending') {
      statusColor = AppColors.orange;
    } else if (order.status == 'Preparing') {
      statusColor = Colors.blue;
    } else {
      statusColor = AppColors.green;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.iceGray, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.id,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.darkBlue,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    order.timeAgo,
                    style: TextStyle(
                      color: AppColors.lightSteelBlue,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Text(
                "\$${order.totalPrice.toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: AppColors.iceGray),

          // Customer Profile Info
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(order.customerImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.customerName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Delivery Address: Building 12, Al Rehab City",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Order Items Box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.lightgray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.restaurant_rounded, color: AppColors.darkGray, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    order.dishes,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.bluegray,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (showActions) ...[
            const SizedBox(height: 16),
            _buildActionButtons(context),
          ] else ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final cubit = context.read<ChefCubit>();

    if (order.status == 'Pending') {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                cubit.declineOrder(order.id);
                _showActionFeedback(context, "Order Declined", AppColors.error);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.error),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                "Decline",
                style: TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                cubit.updateOrderStatus(order.id, "Preparing");
                _showActionFeedback(context, "Order Accepted!", AppColors.green);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                "Accept Request",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    } else if (order.status == 'Preparing') {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            cubit.updateOrderStatus(order.id, "Completed");
            _showActionFeedback(context, "Order is ready for pickup!", AppColors.green);
          },
          icon: const Icon(Icons.check_circle_outline_rounded, color: Colors.white),
          label: const Text(
            "Mark as Ready",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      );
    } else {
      return Row(
        children: [
          Icon(Icons.check_circle_rounded, color: AppColors.green, size: 20),
          const SizedBox(width: 8),
          Text(
            "Completed & Delivered",
            style: TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.star_rate_rounded, color: Colors.amber, size: 16),
            label: const Text(
              "5.0 Review",
              style: TextStyle(color: Colors.amber, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }
  }

  void _showActionFeedback(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
