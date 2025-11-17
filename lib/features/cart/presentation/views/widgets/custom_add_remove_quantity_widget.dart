import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomAddAndRemoveQuantityWidget extends StatefulWidget {
  const CustomAddAndRemoveQuantityWidget({super.key});

  @override
  State<CustomAddAndRemoveQuantityWidget> createState() =>
      _CustomAddAndRemoveQuantityWidgetState();
}

class _CustomAddAndRemoveQuantityWidgetState
    extends State<CustomAddAndRemoveQuantityWidget> {
  int quantity = 1; // الكمية الافتراضية

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "14'’",
          style: AppTextStyle.sen400Style17.copyWith(color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // زر النقصان
            GestureDetector(
              onTap: decreaseQuantity,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // جعل الشكل دائري
                  color: AppColors.bluegray, // لون الخلفية
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.assetsImagesSubtract,
                    height: 5,
                    width: 5,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 18),
            Text(
              quantity.toString(),
              style: AppTextStyle.sen700Style16.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 18),

            GestureDetector(
              onTap: increaseQuantity,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // جعل الشكل دائري
                  color: AppColors.bluegray, // لون الخلفية
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.assetsImagesAdd,
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
