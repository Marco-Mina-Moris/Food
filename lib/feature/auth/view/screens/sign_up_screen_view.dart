import 'package:flutter/material.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_fiel.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:food/core/utils/validator_functions.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
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
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SIGN UP',
                            style: GoogleFonts.sen(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Please sign up to get started',
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
                            'NAME',
                            style: GoogleFonts.sen(
                              fontSize: 13,
                              color: Color(0xff32343E),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: nameController,
                            validator: Validator.validateName,
                            hintText: "Marco Mina",
                            keyboardType: TextInputType.name,
                            action: TextInputAction.next,
                          ),
                          SizedBox(height: 24),
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
                          Text(
                            'Re-Type Password',
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
                            controller: repasswordController,
                            validator:
                                (value) => Validator.validateConfirmPassword(
                                  value,
                                  repasswordController.text,
                                ),
                            hintText: '• • • • • • • • • •',
                            keyboardType: TextInputType.visiblePassword,
                            action: TextInputAction.next,
                          ),
                          SizedBox(height: 20),

                          // Remember me and Forgot password
                          SizedBox(height: 30),
                          // Login button
                          CustomButton(
                            text: 'Sign Up',
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(
                                context,
                                '/permission',
                              );
                              // }
                            }, ontap: () {  },
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
