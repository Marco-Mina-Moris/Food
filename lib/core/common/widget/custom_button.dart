import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double? height;
  final double? width;
  final double fontSize;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    Color? color,
    this.textColor = Colors.white,
    this.borderRadius = 12,
    this.height = 60,
    this.width,
    this.fontSize = 16,
  }) : color = color ?? AppColors.orange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: GoogleFonts.sen(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
