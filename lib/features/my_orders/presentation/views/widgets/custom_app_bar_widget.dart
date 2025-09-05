
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.LightGrayishBlue,
          radius: 25,
          child: SvgPicture.asset(
            Assets.assetsImagesBack,
            fit: BoxFit.cover,
            width: 10,
            height: 15,
          ),
        ),
        Spacer(flex: 1),
        Text(AppStrings.myoreders, style: AppTextStyle.sen400Style17),
        Spacer(flex: 8),
        CircleAvatar(
          backgroundColor: AppColors.LightGrayishBlue,
          radius: 25,
          child: SvgPicture.asset(
            Assets.assetsImagesMore,
            fit: BoxFit.cover,
            width: 16,
            height: 7,
          ),
        ),
      ],
    );
  }
}
