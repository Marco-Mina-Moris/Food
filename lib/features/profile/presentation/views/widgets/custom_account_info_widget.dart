import 'package:flutter/material.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';

class CustomAccountInfoWidget extends StatelessWidget {
  const CustomAccountInfoWidget({super.key});

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
              leadinimgae: Assets.assetsImagesPersonalinfo,
              titleText: AppStrings.personalInfo,
            ),
            SizedBox(height: 16),
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesAddress,
              titleText: AppStrings.addresses,
            ),
          ],
        ),
      ),
    );
  }
}
