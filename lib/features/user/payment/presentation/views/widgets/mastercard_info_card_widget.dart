
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';

class MasterCardInfoCard extends StatelessWidget {
  const MasterCardInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 82,
      decoration: BoxDecoration(
        color: Color(0xffF4F5F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.mastercard,
              style: AppTextStyle.sen700Style16.copyWith(
                color: AppColors.bluegray,
              ),
            ),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.assetsImagesMastercard),
                      SizedBox(width: 7),
                      Text('************472'),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  Assets.assetsImagesPolygon,
                  height: 8,
                  width: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
