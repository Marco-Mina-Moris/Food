import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/tracking_order/presentation/views/delivery_man_call_view.dart';

class CourierInfoCard extends StatelessWidget {
  const CourierInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, -2), // shadow above the container
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(Assets.assetsImagesRestuarant),
        ),
        title: Text(
          "Robert F.",
          style: AppTextStyle.sen700Style20.copyWith(
            color: AppColors.veryDarkBlue,
          ),
        ),
        subtitle: Text(
          "Courier",
          style: AppTextStyle.sen400Style14.copyWith(
            color: AppColors.lightSteelBlue,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return DeliveryManCallView();
                    },
                  ),
                );
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(Assets.assetsImagesPhoneCall),
                ),
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: (){
                
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.orange),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(Assets.assetsImagesMessage),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
