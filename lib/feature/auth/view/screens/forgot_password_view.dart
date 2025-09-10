import 'package:flutter/material.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_fiel.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:food/core/utils/validator_functions.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

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
                          // Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Forgot Password',
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Please sign in to your existing account',
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24),
                          // Email field
                          Text(
                            'EMAIL',
                            style: GoogleFonts.sen(
                              fontSize: 13,
                              color: Color(0xff32343E),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: emailController,
                            validator: Validator.validateEmail,
                            hintText: "example@gmail.com",
                            keyboardType: TextInputType.emailAddress,
                            action: TextInputAction.next,
                          ),
                          SizedBox(height: 20),
                          // Send Code button
                          CustomButton(
                            text: 'SEND CODE',
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              // If the form is valid, navigate to the verification screen
                              Navigator.pushReplacementNamed(
                                context,
                                '/verification',
                              );
                              // }
                            },
                          ),
                        ],
                      ),
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
