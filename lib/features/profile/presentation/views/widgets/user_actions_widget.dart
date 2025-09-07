import 'package:flutter/material.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';

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
            ),
            SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesFav,
              titleText: AppStrings.favourite,
            ),
            SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesNotif,
              titleText: AppStrings.notifications,
            ),
            SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesPaymethod,
              titleText: AppStrings.paymentMethod,
            ),
          ],
        ),
      ),
    );
  }
}
