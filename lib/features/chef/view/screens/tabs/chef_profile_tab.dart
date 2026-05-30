import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/features/chef/view_model/chef_cubit.dart';
import 'package:food/features/chef/view/widgets/chef_review_item.dart';
import 'package:food/features/chef/view/widgets/chef_switch_row.dart';
import 'package:food/features/user/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:food/core/storage_helper/secure_storage_helper.dart';

class ChefProfileTab extends StatelessWidget {
  const ChefProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
          child: Column(
            children: [
              // Screen Title
              Text(
                "Kitchen Profile",
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 24),

              // Restaurant Logo & Banner Info
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.orange, width: 3),
                            image: const DecorationImage(
                              image: NetworkImage("https://images.unsplash.com/photo-1577219491135-ce391730fb2c?auto=format&fit=crop&w=150&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.star_rounded, color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Chef Marco's Kitchen",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Gourmet Burgers, Pizzas, and Dessert Platters",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Settings Option Box
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightgray,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Switch back to Client Mode
                    CustomListTileWidget(
                      leadinimgae: "assets/images/personalinfo.svg",
                      titleText: "Switch to Customer Mode",
                      ontap: () async {
                        await SecureStorageHelper.setRole('User');
                        if (context.mounted) {
                          AppRoutes.clearAndNavigateToHome(context);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    // View Customer Reviews
                    CustomListTileWidget(
                      leadinimgae: "assets/images/userrevew.svg",
                      titleText: "Client Reviews",
                      ontap: () {
                        _showReviewsBottomSheet(context);
                      },
                    ),
                    const SizedBox(height: 16),
                    // Kitchen Settings
                    CustomListTileWidget(
                      leadinimgae: "assets/images/setting.svg",
                      titleText: "Kitchen Settings",
                      ontap: () {
                        _showKitchenSettingsBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Quick Bio/Summary card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.iceGray, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Our Kitchen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "We cook high-quality dishes using only fresh, local ingredients. Our kitchen adheres strictly to health and safety standards to guarantee delicious and safe dining experiences at home.",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.darkGray,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReviewsBottomSheet(BuildContext context) {
    final reviews = context.read<ChefCubit>().reviews;

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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                        "Client Reviews",
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
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: reviews.length,
                      separatorBuilder: (context, index) => const Divider(height: 24, color: AppColors.iceGray),
                      itemBuilder: (context, index) {
                        final rev = reviews[index];
                        return ChefReviewItem(review: rev);
                      },
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

  void _showKitchenSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                    "Kitchen Settings",
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
              ChefSwitchRow(
                title: "Accepting Orders",
                subtitle: "Allow users to place orders",
                value: true,
                onChanged: (val) {},
              ),
              const SizedBox(height: 16),
              ChefSwitchRow(
                title: "Fast Prep Mode",
                subtitle: "Sets average prep time to 15m",
                value: false,
                onChanged: (val) {},
              ),
            ],
          ),
        );
      },
    );
  }
}
