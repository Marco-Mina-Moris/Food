import 'package:flutter/material.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/features/user/app_section/app_section.dart';
import 'package:food/features/user/profile/presentation/views/widgets/custom_list_tile_widget.dart';

class UserActionsWidget extends StatelessWidget {
  const UserActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesCart,
              titleText: AppStrings.cart,
              ontap: () {
                Navigator.pushNamed(context, AppRoutes.cart);
              },
            ),
            const SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesFav,
              titleText: AppStrings.favourite,
              ontap: () {
                // Switch tab to Favorite Screen
                AppSection.activeTabNotifier.value = 2;
              },
            ),
            const SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesNotif,
              titleText: AppStrings.notifications,
              ontap: () {
                _showNotificationsBottomSheet(context);
              },
            ),
            const SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesPaymethod,
              titleText: AppStrings.paymentMethod,
              ontap: () {
                Navigator.pushNamed(context, AppRoutes.payment, arguments: 0.0);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showNotificationsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildNotificationItem(
                Icons.local_offer_rounded,
                "50% OFF promo code!",
                "Get 50% discount on your first 3 orders using code NEW50.",
                "2 hours ago",
              ),
              Divider(height: 24, color: AppColors.iceGray),
              _buildNotificationItem(
                Icons.restaurant_rounded,
                "Order delivered successfully",
                "Your order from 'Burger House' was delivered by captain Ahmed.",
                "1 day ago",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem(IconData icon, String title, String description, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.orange.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.orange, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                time,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.lightSteelBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
