import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/features/user/profile/presentation/views/widgets/custom_account_info_widget.dart';
import 'package:food/features/user/profile/presentation/views/widgets/custom_log_out_widget.dart';
import 'package:food/features/user/profile/presentation/views/widgets/profile_image_name_widget.dart';
import 'package:food/features/user/profile/presentation/views/widgets/user_actions_widget.dart';
import 'package:food/features/user/profile/presentation/views/widgets/user_support_option_widget.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_cubit.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 25),
        child: Column(
          children: [
            const SizedBox(height: 25),
            CustomAppBarWidget(title: AppStrings.profile),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProfileError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              context.read<ProfileCubit>().loadProfile();
                            },
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: ProfileImageNameWidget()),
                      const SliverToBoxAdapter(child: SizedBox(height: 32)),
                      SliverToBoxAdapter(child: CustomAccountInfoWidget()),
                      const SliverToBoxAdapter(child: SizedBox(height: 20)),
                      SliverToBoxAdapter(child: UserActionsWidget()),
                      const SliverToBoxAdapter(child: SizedBox(height: 20)),
                      SliverToBoxAdapter(child: UserSupportWidget()),
                      const SliverToBoxAdapter(child: SizedBox(height: 20)),
                      SliverToBoxAdapter(child: CustomLogOutWidget()),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
