import 'package:flutter/material.dart';
import 'package:food/core/common/widget/Custom_button.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/common/widget/custom_form_text_fiel.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/payment/presentation/views/congratulation_view.dart';

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBarWidget(
              title: AppStrings.addCard,
              leadingImage: Assets.assetsImagesClose,
              trailing: SizedBox(),
            ),
            SizedBox(height: 24),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.cardHolderName,
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.lightSteelBlue,
                    ),
                  ),
                  SizedBox(height: 9),
                  CustomTextFormField(
                    fillColor: AppColors.paleBlue,
                    hintText: 'Norhan Walid',
                    hintststyle: AppTextStyle.sen400Style16.copyWith(
                      color: AppColors.bluegray,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.cardNumber,
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.lightSteelBlue,
                    ),
                  ),
                  SizedBox(height: 9),
                  CustomTextFormField(
                    fillColor: AppColors.paleBlue,
                    hintText: '2134   _ _ _ _  _ _ _ _',
                    hintststyle: AppTextStyle.sen400Style16.copyWith(
                      color: AppColors.bluegray,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.expireDate,
                          style: AppTextStyle.sen400Style14.copyWith(
                            color: AppColors.lightSteelBlue,
                          ),
                        ),
                        SizedBox(height: 9),
                        CustomTextFormField(
                          fillColor: AppColors.paleBlue,
                          hintText: 'mm/yyyy',
                          hintststyle: AppTextStyle.sen400Style16.copyWith(
                            color: AppColors.bluegray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 27),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.cvc,
                          style: AppTextStyle.sen400Style14.copyWith(
                            color: AppColors.lightSteelBlue,
                          ),
                        ),
                        SizedBox(height: 9),
                        CustomTextFormField(
                          fillColor: AppColors.paleBlue,
                          hintText: '***',
                          hintststyle: AppTextStyle.sen400Style16.copyWith(
                            color: AppColors.bluegray,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              text: AppStrings.addMakePayment,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return CongratulationView();
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
