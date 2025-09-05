import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/my_orders/presentation/views/widgets/custom_button.dart';

class CustomOngingItemCard extends StatelessWidget {
  const CustomOngingItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Food',
            style: AppTextStyle.sen400Style14.copyWith(
              color: AppColors.veryDarkBlue,
            ),
          ),
          SizedBox(height: 10),
          Divider(endIndent: 15, indent: 15, color: Color(0xffEEF2F6)),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.VbZFmURkNbtq8Ly8ciXsigHaFk?w=194&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pizza Hut', style: AppTextStyle.sen700Style14),
                          //Spacer(),
                          Text(
                            '#162432',
                            style: AppTextStyle.sen400Style14.copyWith(
                              color: AppColors.darkGray,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text('\$30.25', style: AppTextStyle.sen700Style14),
                            SizedBox(width: 14),
                            VerticalDivider(
                              color: AppColors.lavenderGray,
                              thickness: 1,
                              //width: 20, // space around divider
                              // end pad
                            ),
                            SizedBox(width: 14),
                            Text(
                              '03 Items',
                              style: AppTextStyle.sen400Style12.copyWith(
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                color: AppColors.orange,
                text: AppStrings.trackOrder,
                colorText: Colors.white,
              ),
              CustomButton(
                color: Colors.white,
                text: AppStrings.cancel,
                colorText: AppColors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
