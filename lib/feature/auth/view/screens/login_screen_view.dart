import 'package:flutter/material.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_fiel.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:food/core/utils/validator_functions.dart';
import 'package:food/feature/auth/view/widget/social_button_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;

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
                          image: AssetImage(AssetsConstants.appBar),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log In',
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
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
                          SizedBox(height: 24),
                          // Password field
                          Text(
                            'PASSWORD',
                            style: GoogleFonts.sen(
                              fontSize: 13,
                              color: Color(0xff32343E),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            isPassword: true,
                            controller: passwordController,
                            validator: Validator.validatePassword,
                            hintText: '• • • • • • • • • •',
                            keyboardType: TextInputType.visiblePassword,
                            action: TextInputAction.next,
                          ),
                          SizedBox(height: 20),
                          // Remember me and Forgot password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe = value!;
                                      });
                                    },
                                    activeColor: Color(0xFFFF6B35),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: GoogleFonts.sen(
                                      color: Color(0XFF7E8A97),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/forgot-password',
                                  );
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: GoogleFonts.sen(
                                    color: Color(0xFFFF7622),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          // Login button
                          CustomButton(
                            text: 'LOG IN',
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {

                              // }
                            },
                          ),
                          SizedBox(height: 38),
                          // Sign up link
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/signup',
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: GoogleFonts.sen(
                                    color: Color(0xff646982),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'SIGN UP',
                                      style: GoogleFonts.sen(
                                        color: Color(0xFFFF7622),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 27),
                          // Or divider
                          Center(
                            child: Text(
                              'Or',
                              style: GoogleFonts.sen(
                                color: Color(0xff646982),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          // Social login buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialButton(
                                assetPath: AssetsConstants.facebook,
                                color: Color(0xFF395998),
                              ),
                              SizedBox(width: 20),
                              SocialButton(
                                assetPath: AssetsConstants.twitter,
                                color: Color(0xFF169CE8),
                              ),
                              SizedBox(width: 20),
                              SocialButton(
                                assetPath: AssetsConstants.apple,
                                color: Color(0xFF1B1F2F),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
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
