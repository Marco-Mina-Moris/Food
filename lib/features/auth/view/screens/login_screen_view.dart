import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_field.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/validator_functions.dart';

import 'package:food/core/constants/assets_constants.dart';
import 'package:food/features/auth/view/widget/auth_layout_widget.dart';
import 'package:food/features/auth/viewmodel/auth_cubit.dart';
import 'package:food/features/auth/viewmodel/auth_state.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, '/permission');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        bool rememberMe = state.rememberMe;

        return AuthLayout(
          title: "Log In",
          subtitle: "Please sign in to your existing account",
          image: AssetsConstants.appBar,
          showBackButton: false,

          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // Email
                Text("EMAIL", style: GoogleFonts.sen(fontSize: 13)),
                const SizedBox(height: 8),
                CustomTextFormField(
                  isPassword: false,
                  controller: _emailController,
                  validator: Validator.validateEmail,
                  hintText: "example@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  action: TextInputAction.next,
                  fillColor: AppColors.lightSteelBlue,
                ),

                const SizedBox(height: 24),

                // Password
                Text("PASSWORD", style: GoogleFonts.sen(fontSize: 13)),
                const SizedBox(height: 8),
                CustomTextFormField(
                  isPassword: true,
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                  hintText: '• • • • • • • • • •',
                  keyboardType: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                ),

                const SizedBox(height: 20),

                // Remember Me + Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            context.read<AuthCubit>().toggleRememberMe(
                              value ?? false,
                            );
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
                          color: AppColors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Login
                if (state is AuthLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  CustomButton(
                    text: 'LOG IN',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                      }
                    },
                  ),

                const SizedBox(height: 20),

                // Sign Up
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signup');
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
                              color: AppColors.orange,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Or Divider
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
                const SizedBox(height: 15),
                // Social Google Button
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.orange, width: 1.5),
                  ),
                  child: GestureDetector(
                    onTap: () => context.read<AuthCubit>().signInWithGoogle(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsConstants.google,
                          height: 37,
                          width: 37,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Login With Google",
                          style: GoogleFonts.sen(
                            color: AppColors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
