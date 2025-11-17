import 'package:flutter/material.dart';
import 'package:food/core/common/widget/Custom_button.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/tracking_order/presentation/views/tracking_order_view.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 228,
              height: 207,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImagesCongratulation),
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            SizedBox(height: 32),
            Text(
              AppStrings.congratulations,
              style: AppTextStyle.sen700Style20.copyWith(
                fontSize: 24,
                color: Color(0xff111A2C),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 245,
              height: 48,
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.youSuccessfullyMakedAPayment,
                style: AppTextStyle.sen400Style14.copyWith(
                  color: Color.fromARGB(255, 136, 138, 141),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              text: AppStrings.trackOrder2,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return TrackingOrderView();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
