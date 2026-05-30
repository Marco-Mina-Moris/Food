import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderProgressTrackerWidget extends StatelessWidget {
  final int currentStep;
  final String estimatedTime;

  const OrderProgressTrackerWidget({
    super.key,
    required this.currentStep,
    required this.estimatedTime,
  });

  Widget? _buildIndicator(int stepIndex) {
    if (currentStep == stepIndex) {
      return Container(
        width: 35,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.orange,
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.assetsImagesLoading,
            fit: BoxFit.contain,
            width: 20,
            height: 20,
          ),
        ),
      );
    }
    return null;
  }

  Color _getLineColor(int stepIndex) {
    return currentStep >= stepIndex ? AppColors.orange : const Color(0xffBFBCBA);
  }

  Color _getTextColor(int stepIndex) {
    return currentStep >= stepIndex ? AppColors.orange : AppColors.lightSteelBlue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        child: Column(
          children: [
            Text(
              estimatedTime,
              style: AppTextStyle.sen700Style20.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                color: AppColors.veryDarkBlue,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'ESTIMATED DELIVERY TIME',
              style: AppTextStyle.sen400Style14.copyWith(
                color: AppColors.lightSteelBlue,
              ),
            ),
            const SizedBox(height: 36),
            
            // Step 0: Received
            TimelineTile(
              isFirst: true,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: currentStep >= 0 ? AppColors.orange : const Color(0xffBFBCBA),
                indicator: _buildIndicator(0),
                iconStyle: currentStep > 0
                    ? IconStyle(iconData: Icons.check, color: Colors.white)
                    : null,
              ),
              afterLineStyle: LineStyle(color: _getLineColor(1)),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your order has been received",
                      style: AppTextStyle.sen400Style14.copyWith(
                        color: _getTextColor(0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Step 1: Preparing
            TimelineTile(
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: currentStep >= 1 ? AppColors.orange : const Color(0xffBFBCBA),
                indicator: _buildIndicator(1),
                iconStyle: currentStep > 1
                    ? IconStyle(iconData: Icons.check, color: Colors.white)
                    : null,
              ),
              beforeLineStyle: LineStyle(color: _getLineColor(1)),
              afterLineStyle: LineStyle(color: _getLineColor(2)),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "The restaurant is preparing your food",
                      style: AppTextStyle.sen400Style14.copyWith(
                        color: _getTextColor(1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Step 2: Picked Up
            TimelineTile(
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: currentStep >= 2 ? AppColors.orange : const Color(0xffBFBCBA),
                indicator: _buildIndicator(2),
                iconStyle: currentStep > 2
                    ? IconStyle(iconData: Icons.check, color: Colors.white)
                    : null,
              ),
              beforeLineStyle: LineStyle(color: _getLineColor(2)),
              afterLineStyle: LineStyle(color: _getLineColor(3)),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your order has been picked up for delivery",
                      style: AppTextStyle.sen400Style14.copyWith(
                        color: _getTextColor(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Step 3: Arriving Soon
            TimelineTile(
              isLast: true,
              indicatorStyle: IndicatorStyle(
                width: 20,
                color: currentStep >= 3 ? AppColors.orange : const Color(0xffBFBCBA),
                indicator: _buildIndicator(3),
                iconStyle: currentStep > 3
                    ? IconStyle(iconData: Icons.check, color: Colors.white)
                    : null,
              ),
              beforeLineStyle: LineStyle(color: _getLineColor(3)),
              endChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order arriving soon!",
                      style: AppTextStyle.sen400Style14.copyWith(
                        color: _getTextColor(3),
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
