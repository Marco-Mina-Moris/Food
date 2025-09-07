
import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';

class ProfileImageNameWidget extends StatelessWidget {
  const ProfileImageNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color.fromARGB(255, 252, 182, 160),
        ),
        SizedBox(width: 32),
        Column(
          children: [
            Text(
              "Norhan Walid",
              style: AppTextStyle.sen700Style20.copyWith(
                color: AppColors.bluegray,
              ),
            ),
            Text(
              AppStrings.ilovefastfood,
              style: AppTextStyle.sen400Style14.copyWith(
                color: AppColors.lightSteelBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
