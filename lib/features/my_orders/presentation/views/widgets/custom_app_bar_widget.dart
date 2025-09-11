import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.trailing,
    this.ontap, // Optional trailing widget
  });

  final String title;
  final Widget? trailing; // Can be null, an SVG, or a Text button
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.lightGrayishBlue, // Assuming #A0A5BA
          radius: 25,
          child: SvgPicture.asset(
            Assets.assetsImagesBack,
            fit: BoxFit.cover,
            width: 10,
            height: 15,
          ),
        ),
        const Spacer(flex: 1),
        Text(
          title,
          style: AppTextStyle.sen400Style17.copyWith(
            color: AppColors.veryDarkBlue,
          ),
        ),
        const Spacer(flex: 8),
        GestureDetector(
          onTap: ontap,
          child: trailing ?? SvgPicture.asset(Assets.assetsImagesMore),
        ), // Fallback to "more" icon if trailing is null
      ],
    );
  }
}
