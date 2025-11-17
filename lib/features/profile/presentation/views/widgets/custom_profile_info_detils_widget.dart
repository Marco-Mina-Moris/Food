import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomProfileInfoDetailsWidget extends StatelessWidget {
  const CustomProfileInfoDetailsWidget({super.key});

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
            ListTile(
              subtitle: Text(
                'Norhan Walid',
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              leading: SvgPicture.asset(
                Assets.assetsImagesPersonalinfo,
                width: 40,
                height: 40,
              ),
              title: Text(
                AppStrings.fullName,
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.bluegray,
                ),
              ),
            ),
            ListTile(
              subtitle: Text(
                'norhanw@gmail.com',
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              leading: SvgPicture.asset(
                Assets.assetsImagesEmail,
                width: 40,
                height: 40,
              ),
              title: Text(
                AppStrings.email,
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.bluegray,
                ),
              ),
            ),
            ListTile(
              subtitle: Text(
                '01152416400',
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              leading: SvgPicture.asset(
                Assets.assetsImagesPhone,
                width: 40,
                height: 40,
              ),
              title: Text(
                AppStrings.phoneNumber,
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.bluegray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
