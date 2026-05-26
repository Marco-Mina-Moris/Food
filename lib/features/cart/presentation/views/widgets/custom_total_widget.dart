
import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomTotalWidget extends StatelessWidget {
  final double totalPrice;

  const CustomTotalWidget({
    super.key,
    required this.totalPrice,
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
            '\$${totalPrice.toStringAsFixed(2)}',
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
