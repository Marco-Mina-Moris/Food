import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_form_text_field.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/validator_functions.dart';

import 'package:food/features/auth/view/widget/auth_layout_widget.dart';
import 'package:food/features/auth/viewmodel/auth_cubit.dart';
import 'package:food/features/auth/viewmodel/auth_state.dart';

import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthPasswordResetSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushReplacementNamed(context, '/login');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return AuthLayout(
          title: "Forgot Password",
          subtitle: "Please enter your email to reset password",
          showBackButton: true,
          onBackButtonPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          image: AssetsConstants.appBarV2,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  'EMAIL',
                  style: GoogleFonts.sen(
                    fontSize: 13,
                    color:  AppColors.bluegray,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: emailController,
                  validator: Validator.validateEmail,
                  hintText: "example@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                if (state is AuthLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  CustomButton(
                    text: 'SEND EMAIL',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().resetPassword(
                          emailController.text,
                          context,
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
