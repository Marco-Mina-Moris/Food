import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.color,
    required this.text,
    required this.colorText,
  });
  final Color color;
  final String text;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 139,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        border: Border.all(color: AppColors.orange),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.sen700Style12.copyWith(color: colorText),
        ),
      ),
    );
  }
}
