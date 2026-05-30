import 'package:flutter/material.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/features/user/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:food/core/storage_helper/secure_storage_helper.dart';

class UserSupportWidget extends StatelessWidget {
  const UserSupportWidget({super.key});

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
              leadinimgae: Assets.assetsImagesFaqs2,
              titleText: AppStrings.fAQs,
              ontap: () {
                _showFAQsBottomSheet(context);
              },
            ),
            const SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesUserrevew,
              titleText: AppStrings.userReviews,
              ontap: () {
                _showUserReviewsBottomSheet(context);
              },
            ),
            const SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesPersonalinfo,
              titleText: "Switch to Chef Mode",
              ontap: () async {
                await SecureStorageHelper.setRole('Chef');
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.chefDashboard,
                    (route) => false,
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesSetting,
              titleText: AppStrings.settings,
              ontap: () {
                _showSettingsBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showFAQsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.iceGray,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FAQs",
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
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        _buildFAQItem(
                          "How long does delivery take?",
                          "Our typical delivery time is 30 to 45 minutes depending on your location and restaurant prep time.",
                        ),
                        const SizedBox(height: 12),
                        _buildFAQItem(
                          "What payment methods do you accept?",
                          "We accept Cash on Delivery, Visa, MasterCard, and PayPal. You can manage them in the Payment Methods tab.",
                        ),
                        const SizedBox(height: 12),
                        _buildFAQItem(
                          "Can I cancel my order?",
                          "You can cancel your order within 5 minutes of placing it. After that, the kitchen has started preparing your food.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showUserReviewsBottomSheet(BuildContext context) {
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
                    "User Reviews",
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
              _buildReviewItem(
                "Sarah Miller",
                5.0,
                "Super fast delivery and the food was hot! Love this app.",
              ),
              const Divider(height: 24, color: AppColors.iceGray),
              _buildReviewItem(
                "John Doe",
                4.5,
                "Great selection of restaurants and the live maps tracking works perfectly.",
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
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
                        "Settings",
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
                  _buildSettingSwitch(
                    "Push Notifications",
                    "Receive alerts about orders and offers",
                    true,
                    (val) {},
                  ),
                  const SizedBox(height: 16),
                  _buildSettingSwitch(
                    "Dark Mode",
                    "Switch application theme style",
                    false,
                    (val) {},
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.iceGray, width: 1),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColors.darkBlue,
          ),
        ),
        iconColor: AppColors.orange,
        collapsedIconColor: AppColors.lightSteelBlue,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.darkGray,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, double rating, String review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.darkBlue,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  "$rating",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: AppColors.darkBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          review,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.darkGray,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingSwitch(String title, String desc, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.lightSteelBlue,
                ),
              ),
            ],
          ),
        ),
        Switch.adaptive(
          value: value,
          activeColor: AppColors.orange,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
