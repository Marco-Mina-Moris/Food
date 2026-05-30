import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/core/storage_helper/secure_storage_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showDesignElements = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          showDesignElements = true;
        });
      }
    });
    Future.delayed(const Duration(seconds: 4), () async {
      if (!mounted) return;

      // 1. Check Onboarding
      final onboardingCompleted = await SecureStorageHelper.isOnboardingCompleted();
      if (!onboardingCompleted) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
        return;
      }

      // 2. Check Firebase Session
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/login');
        }
        return;
      }

      // Load user profile
      if (mounted) {
        context.read<ProfileCubit>().loadProfile();
      }

      // 3. Check Location Permission
      final status = await Permission.location.status;
      if (!status.isGranted && !status.isLimited) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/permission');
        }
        return;
      }

      // 4. Check Stored Role
      final role = await SecureStorageHelper.getRole();
      if (mounted) {
        if (role == 'Chef') {
          Navigator.pushReplacementNamed(context, '/chef/dashboard');
        } else {
          Navigator.pushReplacementNamed(context, '/home-v1');
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: showDesignElements ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            child: Image.asset(
              AssetsConstants.splash1,
              width: 200,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: FadeInLeft(
              duration: const Duration(milliseconds: 800),
              child: Image.asset(
                AssetsConstants.logo,
                width: 121.13,
                height: 58.88,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: showDesignElements ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Image.asset(
                AssetsConstants.splash2,
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
