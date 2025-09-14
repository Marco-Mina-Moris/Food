
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';

class NoMasterCardPlaceholderWidget extends StatelessWidget {
  const NoMasterCardPlaceholderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF7F8F9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          SvgPicture.asset(Assets.assetsImagesCarddd),
          SizedBox(height: 20),
          Text(
            AppStrings.noMasterCardAdded,
            style: AppTextStyle.sen700Style16.copyWith(
              color: AppColors.bluegray,
            ),
          ),
          SizedBox(height: 6),
          SizedBox(
            height: 61,
            width: 266,
            child: Text(
              textAlign: TextAlign.center,
              AppStrings.youCanAddAmastercard,
              style: AppTextStyle.sen400Style17.copyWith(
                color: AppColors.lightSteelBlue,
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

