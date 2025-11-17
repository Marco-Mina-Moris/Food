import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food/core/constants/assets_constants.dart';

class AuthLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Widget child;
  final bool showBackButton;
  final void Function()? onBackButtonPressed;

  const AuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.child,
    this.showBackButton = true,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Header with gradient background
              SizedBox(
                height: 350,
                child: Stack(
                  children: [
                    // Diagonal lines pattern
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff121223),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (showBackButton)
                      Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(
                          left: 16,
                          top: 40,
                          bottom: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const ImageIcon(
                            AssetImage(AssetsConstants.back),
                          ),
                          onPressed: onBackButtonPressed,
                        ),
                      ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            subtitle,
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 270,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
