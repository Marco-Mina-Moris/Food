import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.lightGrayishBlue,
          radius: 25,
          child: SvgPicture.asset(
            Assets.assetsImagesBack,
            fit: BoxFit.cover,
            width: 10,
            height: 15,
          ),
        ),
        Spacer(flex: 1),
        Text(title, style: AppTextStyle.sen400Style17),
        Spacer(flex: 8),
        CircleAvatar(
          backgroundColor: AppColors.lightGrayishBlue,
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
