import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_cubit.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_state.dart';

class ProfileImageNameWidget extends StatelessWidget {
  const ProfileImageNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        String name = "Guest User";
        String bio = AppStrings.ilovefastfood;

        if (state is ProfileLoaded) {
          name = state.user.name ?? "User";
          bio = (state.user.bio != null && state.user.bio!.isNotEmpty)
              ? state.user.bio!
              : AppStrings.ilovefastfood;
        } else if (state is ProfileUpdateSuccess) {
          name = state.user.name ?? "User";
          bio = (state.user.bio != null && state.user.bio!.isNotEmpty)
              ? state.user.bio!
              : AppStrings.ilovefastfood;
        }

        return Row(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color.fromARGB(255, 252, 182, 160),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.sen700Style20.copyWith(
                      color: AppColors.bluegray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bio,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.sen400Style14.copyWith(
                      color: AppColors.lightSteelBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
