import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_colors.dart';

class CustomPaymentOptionWidget extends StatelessWidget {
  final String methodImage;
  final String method;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomPaymentOptionWidget({
    super.key,
    required this.methodImage,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 75,
                  width: 86,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : AppColors.paleBlue,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppColors.orange : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Center(child: SvgPicture.asset(methodImage)),
                ),
                // علامة الصح في الركن
                if (isSelected)
                  Positioned(
                    top: -4,
                    right: -1,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orange,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              method,
              style: const TextStyle(
                color: Color(0xff464E57),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
