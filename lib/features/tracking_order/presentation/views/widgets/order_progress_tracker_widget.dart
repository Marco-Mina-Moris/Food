
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderProgressTrackerWidget extends StatelessWidget {
  const OrderProgressTrackerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        child: Column(
          children: [
            Text(
              '20 min',
              style: AppTextStyle.sen700Style20.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                color: AppColors.veryDarkBlue,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'ESTIMATED DELIVERY TIME',
              style: AppTextStyle.sen400Style14.copyWith(
                color: AppColors.lightSteelBlue,
              ),
            ),
            SizedBox(height: 36),
            TimelineTile(
              isFirst: true,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: AppColors.orange,
                iconStyle: IconStyle(
                  iconData: Icons.check,
                  color: Colors.white,
                ),
              ),
              afterLineStyle: LineStyle(color: Colors.orange),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your order has been received",
                      style: AppTextStyle.sen400Style14
                          .copyWith(color: AppColors.orange),
                    ),
                  ),
                ),
              ),
            ),
            TimelineTile(
              indicatorStyle: IndicatorStyle(
                width: 20,
    
                indicator: Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orange,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.assetsImagesLoading,
                      fit: BoxFit.contain,
                      //color: Colors.white, // optional
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
    
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "The restaurant is preparing your food",
                      style: AppTextStyle.sen400Style14
                          .copyWith(
                            color: AppColors.lightSteelBlue,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            TimelineTile(
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: Color(0xffBFBCBA),
                iconStyle: IconStyle(
                  iconData: Icons.check,
                  color: Colors.white,
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your order has been picked up for delivery",
                      style: AppTextStyle.sen400Style14
                          .copyWith(
                            color: AppColors.lightSteelBlue,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            TimelineTile(
              isLast: true,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: Color(0xffBFBCBA),
                iconStyle: IconStyle(
                  iconData: Icons.check,
                  color: Colors.white,
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order arriving soon!",
                      style: AppTextStyle.sen400Style14
                          .copyWith(
                            color: AppColors.lightSteelBlue,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
