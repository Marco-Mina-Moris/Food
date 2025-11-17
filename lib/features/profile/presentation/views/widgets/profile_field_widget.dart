import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class ProfileFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;

  const ProfileFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.heightt,
    this.isBio,
    this.icon,
  });
  final double? heightt;
  final bool? isBio;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyle.sen400Style14.copyWith(
              color: AppColors.veryDarkBlue,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: heightt ?? 60,
            child: TextFormField(
              textAlign: TextAlign.justify,
              maxLines: null,
              expands: isBio ?? false,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: icon,
                hintStyle: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.darkGray,
                ),
                filled: true,
                fillColor: AppColors.paleBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none, // Remove default border
                ),
                contentPadding: const EdgeInsets.all(20.0),
              ),
              style: AppTextStyle.sen400Style14.copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ), // Add validation if provided
        ],
      ),
    );
  }
}
