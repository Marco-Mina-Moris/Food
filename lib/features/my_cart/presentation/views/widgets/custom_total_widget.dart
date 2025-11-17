
import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomTotalWidget extends StatelessWidget {
  const CustomTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            'TOTAL: ',
            style: AppTextStyle.sen400Style14.copyWith(
              color: AppColors.lightSteelBlue,
            ),
          ),
          SizedBox(width: 12),
          Text(
            '\$96',
            style: AppTextStyle.sen400Style12.copyWith(
              fontSize: 30,
              color: AppColors.veryDarkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
