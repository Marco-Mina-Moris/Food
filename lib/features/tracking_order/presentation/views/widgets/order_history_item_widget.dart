
import 'package:flutter/material.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class OrderHistoryItemWidget extends StatelessWidget {
  const OrderHistoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        //height: 200,
        width: double.infinity,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.assetsImagesRestuarant),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //SizedBox(height: 35),
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Uttora Coffee House',
                    style: AppTextStyle.sen400Style17.copyWith(
                      color: AppColors.veryDarkBlue,
                    ),
                  ),
                  Text(
                    'Orderd at 06 Sept, 10:00pm',
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.lightSteelBlue,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '2x Burger',
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '4x Sanwitch',
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
