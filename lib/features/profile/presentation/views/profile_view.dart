import 'package:flutter/material.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/my_orders/presentation/views/widgets/custom_app_bar_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_account_info_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_log_out_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/profile_image_name_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/user_actions_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/user_support_option_widget.dart';

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
              child: CustomScrollView(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
