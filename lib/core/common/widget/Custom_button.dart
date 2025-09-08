import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.ontap, required this.text});
  final void Function()? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
        minimumSize: Size(360, 62),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ), // Optional: adjust border radius
        ),
      ),
      child: Text(
        text,
        style: AppTextStyle.sen700Style16.copyWith(color: Colors.white),
      ),
    );
  }
}
