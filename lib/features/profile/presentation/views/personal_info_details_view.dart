import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/my_orders/presentation/views/widgets/custom_app_bar_widget.dart';
import 'package:food/features/profile/presentation/views/edit_profile_view.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_profile_info_detils_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/profile_image_name_widget.dart';

class PersonalInfoDetailsView extends StatelessWidget {
  const PersonalInfoDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBarWidget(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return EditProfileView();
                    },
                  ),
                );
              },
              title: AppStrings.personalInfo,
              trailing: Text(
                AppStrings.edit,
                style: AppTextStyle.sen400Style14.copyWith(
                  color: AppColors.orange,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.orange,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ProfileImageNameWidget(),
            const SizedBox(height: 32),
            CustomProfileInfoDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
