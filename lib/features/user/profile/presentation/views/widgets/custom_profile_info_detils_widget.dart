import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_cubit.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_state.dart';

class CustomProfileInfoDetailsWidget extends StatelessWidget {
  const CustomProfileInfoDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        String name = "";
        String email = "";
        String phone = "";

        if (state is ProfileLoaded) {
          name = state.user.name ?? "";
          email = state.user.email ?? "";
          phone = state.user.phone ?? "";
        } else if (state is ProfileUpdateSuccess) {
          name = state.user.name ?? "";
          email = state.user.email ?? "";
          phone = state.user.phone ?? "";
        }

        return Container(
          decoration: BoxDecoration(
            color: AppColors.lightgray,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  subtitle: Text(
                    name.isNotEmpty ? name : 'Not set',
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.assetsImagesPersonalinfo,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    AppStrings.fullName,
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.bluegray,
                    ),
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    email.isNotEmpty ? email : 'Not set',
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.assetsImagesEmail,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    AppStrings.email,
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.bluegray,
                    ),
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    phone.isNotEmpty ? phone : 'Not set',
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.assetsImagesPhone,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    AppStrings.phoneNumber,
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.bluegray,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
