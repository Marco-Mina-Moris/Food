import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.leadinimgae,
    required this.titleText,
    this.ontap,
  });
  final String leadinimgae;
  final String titleText;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: SvgPicture.asset(leadinimgae, width: 40, height: 40),
      title: Text(
        titleText,
        style: AppTextStyle.sen400Style16.copyWith(color: AppColors.bluegray),
      ),
      trailing: SvgPicture.asset(
        Assets.assetsImagesRightarrow,
        width: 30,
        height: 30,
      ),
    );
  }
}
