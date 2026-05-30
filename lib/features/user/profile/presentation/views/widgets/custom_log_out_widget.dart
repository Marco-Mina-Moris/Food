
import 'package:flutter/material.dart';
import 'package:food/core/data/remote_data/firebase_manger.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/user/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:food/core/dialogs/app_toasts.dart';
import 'package:toastification/toastification.dart';
import 'package:food/core/storage_helper/secure_storage_helper.dart';

class CustomLogOutWidget extends StatelessWidget {
  const CustomLogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomListTileWidget(
              leadinimgae: Assets.assetsImagesLogout,
              titleText: AppStrings.logOut,
              ontap: () async {
                try {
                  await SecureStorageHelper.clearRole();
                  await FirebaseManager.logOut();
                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    AppToast.showToast(
                      context: context,
                      title: "Error",
                      description: "Logout failed: $e",
                      type: ToastificationType.error,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
