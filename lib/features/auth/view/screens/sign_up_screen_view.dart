import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_fiel.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:food/core/utils/validator_functions.dart';

import 'package:food/feature/auth/viewmodel/auth_cubit.dart';
import 'package:food/features/auth/view/widget/auth_layout_widget.dart';

import 'package:food/features/auth/viewmodel/auth_state.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, '/permission');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return AuthLayout(
          title: "Sign Up",
          subtitle: "Please sign up to get started",
          onBackButtonPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          image: AssetsConstants.appBarV2,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // Name
                Text(
                  "NAME",
                  style: GoogleFonts.sen(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _nameController,
                  validator: Validator.validateName,
                  hintText: "Marco Mina",
                ),
                const SizedBox(height: 20),

                // Email
                Text(
                  "EMAIL",
                  style: GoogleFonts.sen(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _emailController,
                  validator: Validator.validateEmail,
                  hintText: "example@gmail.com",
                ),
                const SizedBox(height: 20),

                // Password
                Text(
                  "PASSWORD",
                  style: GoogleFonts.sen(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  isPassword: true,
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                  hintText: '• • • • • • • • • •',
                ),
                const SizedBox(height: 20),

                // Confirm Password
                Text(
                  "CONFIRM PASSWORD",
                  style: GoogleFonts.sen(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  isPassword: true,
                  controller: _rePasswordController,
                  validator: (value) => Validator.validateConfirmPassword(
                    value,
                    _passwordController.text,
                  ),
                  hintText: '• • • • • • • • • •',
                ),
                const SizedBox(height: 30),

                // Button
                if (state is AuthLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  CustomButton(
                    text: "SIGN UP",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              name: _nameController.text.trim(),
                            );
                      }
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
