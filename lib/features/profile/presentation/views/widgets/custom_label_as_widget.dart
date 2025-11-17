import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomLabelAsWidget extends StatelessWidget {
  const CustomLabelAsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            minimumSize: Size(94, 45),
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.5),
            ),
          ),
          child: Text(
            AppStrings.home,
            style: AppTextStyle.sen400Style14.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(width: 15),
        ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            minimumSize: Size(94, 45),
            backgroundColor: AppColors.paleBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            AppStrings.work,
            style: AppTextStyle.sen400Style14.copyWith(
              color: AppColors.bluegray,
            ),
          ),
        ),
        const SizedBox(width: 15),
        ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            minimumSize: Size(94, 45),
            backgroundColor: AppColors.paleBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            AppStrings.other,
            style: AppTextStyle.sen400Style14.copyWith(
              color: AppColors.bluegray,
            ),
          ),
        ),
      ],
    );
  }
}
