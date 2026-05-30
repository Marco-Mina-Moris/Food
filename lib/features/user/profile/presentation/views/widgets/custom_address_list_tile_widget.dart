
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_icons.dart';
import 'package:food/core/utils/app_text_style.dart';

class CustomAddressListTileWidget extends StatelessWidget {
  const CustomAddressListTileWidget({
    super.key,
    required this.leadingImage,
    required this.titleText,
    required this.subtitleText,
  });
  final String leadingImage;
  final String titleText;
  final String subtitleText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      width: 327,
      decoration: BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(leadingImage),
           const SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          titleText,
                          style: AppTextStyle.sen400Style14.copyWith(
                            color: AppColors.bluegray,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.assetsIconsEditicon2),
                              SizedBox(width: 16),
                              SvgPicture.asset(AppIcons.assetsIconsDeleteicon),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const  SizedBox(height: 5),
                    Text(
                      subtitleText,
                      style: AppTextStyle.sen400Style14.copyWith(
                        color: AppColors.bluegray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  
  }
}
