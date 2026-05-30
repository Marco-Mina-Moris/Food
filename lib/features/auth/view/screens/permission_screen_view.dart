import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:food/core/dialogs/app_toasts.dart';
import 'package:toastification/toastification.dart';
import 'package:food/core/storage_helper/secure_storage_helper.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  Future<void> _requestLocationPermission(BuildContext context) async {
    final status = await Permission.location.request();
    if (status.isGranted || status.isLimited) {
      final role = await SecureStorageHelper.getRole();
      if (context.mounted) {
        if (role == 'Chef') {
          Navigator.pushReplacementNamed(context, '/chef/dashboard');
        } else {
          Navigator.pushReplacementNamed(context, '/home-v1');
        }
      }
    } else if (status.isDenied) {
      AppToast.showToast(
        context: context,
        title: "Permission Denied",
        description: "Location permission is required to continue.",
        type: ToastificationType.warning,
      );
    } else if (status.isPermanentlyDenied) {
      AppToast.showToast(
        context: context,
        title: "Permission Permanently Denied",
        description: "Please enable location permission in app settings.",
        type: ToastificationType.error,
      );
      await openAppSettings();
    } else if (status.isRestricted) {
      AppToast.showToast(
        context: context,
        title: "Permission Restricted",
        description: "Location permission is restricted on this device.",
        type: ToastificationType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsConstants.locationAccess,
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () => _requestLocationPermission(context),
              color:  AppColors.orange,
              height: 60,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ACCESS LOCATION ',
                    style: GoogleFonts.sen(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    AssetsConstants.location,
                    color: Colors.white,
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38),
            Text(
              'FOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
              textAlign: TextAlign.center,
              style: GoogleFonts.sen(
                color: const Color(0xff646982),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
