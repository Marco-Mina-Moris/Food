import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:food/core/dialogs/app_toasts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  // Timer variables
  Timer? timer;
  int remainingSeconds = 50;
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      remainingSeconds = 50;
      canResend = false;
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _handleResend() {
    if (canResend) {
      _startTimer();

      AppToast.showToast(
        context: context,
        title: 'Code Sent',
        description: 'Verification code has been resent to your email',
        type: ToastificationType.success,
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
                          image: AssetImage(AssetsConstants.appBarV2),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(left: 16, top: 40, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: ImageIcon(AssetImage(AssetsConstants.back)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/forgot-password',
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Verification',
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'We have sent a code to your email',
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'example@gmail.com',
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Main content
              Positioned(
                top: 270,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        // CODE label with Resend timer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CODE',
                              style: GoogleFonts.sen(
                                fontSize: 13,
                                color: Color(0xff32343E),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: canResend ? _handleResend : null,
                              child: Row(
                                children: [
                                  Text(
                                    'Resend',
                                    style: GoogleFonts.sen(
                                      fontSize: 13,
                                      color:
                                          canResend
                                              ? Color(0xffFF7622)
                                              : Color(0xff646982),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      decoration:
                                          canResend
                                              ? TextDecoration.underline
                                              : TextDecoration.none,
                                    ),
                                  ),
                                  if (!canResend) ...[
                                    Text(
                                      ' in.',
                                      style: GoogleFonts.sen(
                                        fontSize: 13,
                                        color: Color(0xff646982),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      '${remainingSeconds}sec',
                                      style: GoogleFonts.sen(
                                        fontSize: 13,
                                        color: Color(0xff32343E),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Pinput(
                          length: 4,
                          onCompleted: (pin) => print(pin),
                          animationCurve: Curves.easeInOut,
                          animationDuration: Duration(milliseconds: 300),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          defaultPinTheme: PinTheme(
                            width: 60,
                            height: 60,
                            textStyle: GoogleFonts.sen(
                              fontSize: 16,
                              color: Color(0xff32343E),
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffF0F5FA),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Send Code button
                        CustomButton(text: 'Verify', onPressed: () {}, ontap: () {  },),
                      ],
                    ),
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
