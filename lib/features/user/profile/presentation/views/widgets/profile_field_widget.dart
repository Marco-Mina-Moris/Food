import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class ProfileFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final double? heightt;
  final bool? isBio;
  final Widget? icon;

  const ProfileFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.readOnly = false,
    this.heightt,
    this.isBio,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            controller: controller,
            readOnly: readOnly,
            textAlign: TextAlign.justify,
            maxLines: (isBio ?? false) ? null : 1,
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
              color: readOnly ? Colors.grey : AppColors.darkGray,
            ),
          ),
        ), // Add validation if provided
      ],
    );
  }
}
