import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/user/app_section/app_section.dart';

class FavoriteEmptyStateWidget extends StatelessWidget {
  const FavoriteEmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Beautiful glowing favorite circle
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.paleBlue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orange.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border_rounded,
                    size: 70,
                    color: AppColors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'No Favorites Yet',
                style: GoogleFonts.sen(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.veryDarkBlue,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'You don\'t have any favorite food items yet. Explore the menu and select your favorite ones!',
                textAlign: TextAlign.center,
                style: GoogleFonts.sen(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              // Explore button
              MaterialButton(
                onPressed: () {
                  AppSection.activeTabNotifier.value = 0; // Redirect to Home tab
                },
                color: AppColors.orange,
                elevation: 0,
                highlightElevation: 0,
                height: 56,
                minWidth: 200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Explore Menu',
                  style: GoogleFonts.sen(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
