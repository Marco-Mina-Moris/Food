import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:food/core/constants/assets_constants.dart';

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
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
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
