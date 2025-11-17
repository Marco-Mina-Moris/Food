import 'package:flutter/material.dart';

import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_fiel.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/cart/presentation/views/widgets/cart_bottom_section_widget.dart';
import 'package:food/features/cart/presentation/views/widgets/cart_item_widget.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomAppBarWidget(
              leadingImage: Assets.assetsImagesBackwhite,
              backColor: AppColors.bluegray,
              title: AppStrings.cart,
              textstyle: AppTextStyle.sen400Style17.copyWith(
                color: Colors.white,
              ),
              trailing: Text(
                AppStrings.editItems,
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.orange,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.orange,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartItemWidget();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 32);
                },
              ),
            ),
          ),
          // Adding the CartBottomSection
          CartBottomSectionWidget(),
        ],
      ),
    );
  }
}
