import 'package:flutter/material.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

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
            SizedBox(height: 24),
            MaterialButton(
              onPressed: () {},
              color: Color(0xffFF7622),
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
                  SizedBox(width: 8),
                  Image.asset(
                    AssetsConstants.location,
                    color: Colors.white,
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
            ),
            SizedBox(height: 38),
            Text(
              'FOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
              textAlign: TextAlign.center,
              style: GoogleFonts.sen(
                color: Color(0xff646982),
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
