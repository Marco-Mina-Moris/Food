import 'package:flutter/material.dart';
import 'package:food/core/common/widget/Custom_button.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_label_as_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/profile_field_widget.dart';

class AddNewAddressBodyWidget extends StatelessWidget {
  const AddNewAddressBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          ProfileFieldWidget(
            label: AppStrings.addresses,
            hintText: "3235 Royal Ln, Mesq, New Jersey 34567",
            icon: Icon(Icons.location_pin, color: AppColors.darkGray),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ProfileFieldWidget(
                  label: AppStrings.street,
                  hintText: "Hasan Nagar",
                  icon: Icon(Icons.location_pin, color: AppColors.darkGray),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ProfileFieldWidget(
                  label: AppStrings.postcode,
                  hintText: "34567",
                  icon: Icon(Icons.location_pin, color: AppColors.darkGray),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProfileFieldWidget(
            label: AppStrings.appartment,
            hintText: "345",
            icon: Icon(Icons.location_pin, color: AppColors.darkGray),
          ),
          const SizedBox(height: 20),
          Text(
            'LABEL AS',
            style: AppTextStyle.sen400Style14.copyWith(
              color: AppColors.bluegray,
            ),
          ),
          const SizedBox(height: 12),
          CustomLabelAsWidget(),
          const SizedBox(height: 32),

          Center(
            child: CustomButton(text: AppStrings.saveLocation, ontap: () {}, onPressed: () {  },),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
