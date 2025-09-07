import 'package:flutter/material.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';

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
            ),
            SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesUserrevew,
              titleText: AppStrings.userReviews,
            ),
            SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesSetting,
              titleText: AppStrings.settings,
            ),
          ],
        ),
      ),
    );
  }
}
