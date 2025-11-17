// CartBottomSection Widget
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/common/widget/Custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_fiel.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/my_cart/presentation/views/widgets/custom_total_widget.dart';
import 'package:food/features/payment/presentation/views/payment_view.dart';

class CartBottomSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.deliveryAddress,
                  style: AppTextStyle.sen400Style14.copyWith(
                    color: AppColors.lightSteelBlue,
                  ),
                ),
                Text(
                  AppStrings.edit,
                  style: AppTextStyle.sen400Style14.copyWith(
                    color: AppColors.orange,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Obour City, Street 31',
              hintststyle: AppTextStyle.sen400Style16.copyWith(
                color: AppColors.lightSteelBlue,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTotalWidget(),

                GestureDetector(
                  child: SvgPicture.asset(
                    Assets.assetsImagesBreakdown,
                    height: 17,
                    width: 86,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomButton(
              text: AppStrings.placeOrder,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return PaymentView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
