import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/core/data/remote_data/firebase_manger.dart';
import 'package:food/core/dialogs/app_toasts.dart';
import 'package:food/features/auth/model/user_model.dart';

import 'package:toastification/toastification.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool rememberMe = false;

  AuthCubit() : super(const AuthInitial());

  //  Login existing user
  Future<void> login(String email, String password) async {
    emit(AuthLoading(rememberMe: state.rememberMe));
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess(result.user, rememberMe: state.rememberMe));
    } on FirebaseAuthException catch (e) {
      emit(
        AuthFailure(
          e.message ?? "Authentication error",
          rememberMe: state.rememberMe,
        ),
      );
    }
  }

  //  Register new user
  Future<void> register(String email, String password, {String? name}) async {
    emit(AuthLoading(rememberMe: state.rememberMe));
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;
      if (user != null && name != null) {
        final userModel = UserModel(
          id: user.uid,
          name: name,
          email: email,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
        await FirebaseManager.addUser(userModel);
      }

      emit(AuthSuccess(user, rememberMe: state.rememberMe));
    } on FirebaseAuthException catch (e) {
      emit(
        AuthFailure(
          e.message ?? "Registration error",
          rememberMe: state.rememberMe,
        ),
      );
    }
  }

  //  Sign in with Google
  Future<void> signInWithGoogle() async {
    emit(AuthLoading(rememberMe: state.rememberMe));
    try {
      final result = await FirebaseManager.signInWithGoogle();
      if (result != null && result.user != null) {
        emit(AuthSuccess(result.user, rememberMe: state.rememberMe));
      } else {
        emit(AuthFailure("Google sign-in cancelled", rememberMe: state.rememberMe));
      }
    } catch (e) {
      emit(AuthFailure("Google sign-in failed: $e", rememberMe: state.rememberMe));
    }
  }

  //  Sign in with Facebook 
  // Future<void> signInWithFacebook() async {
  //   emit(AuthLoading(rememberMe: state.rememberMe));
  //   try {
  //     final result = await FirebaseManager.signInWithFacebook();

  //     final user = result.user;
  //     if (user != null) {
  //       final existingUser = await FirebaseManager.readUserData(user.uid);
  //       if (existingUser == null) {
  //         await FirebaseManager.addUser(
  //           UserModel(
  //             id: user.uid,
  //             name: user.displayName ?? 'Facebook User',
  //             email: user.email ?? '',
  //             createdAt: DateTime.now().millisecondsSinceEpoch,
  //           ),
  //         );
  //       }

  //       emit(AuthSuccess(user, rememberMe: state.rememberMe));
  //     } else {
  //       emit(AuthFailure("Facebook sign-in cancelled", rememberMe: state.rememberMe));
  //     }
  //   } catch (e) {
  //     emit(AuthFailure("Facebook sign-in failed: $e", rememberMe: state.rememberMe));
  //   }
  // }

  //  Reset Password
  Future<void> resetPassword(String email, BuildContext context) async {
    emit(AuthLoading(rememberMe: state.rememberMe));
    try {
      await _auth.sendPasswordResetEmail(email: email);
      AppToast.showToast(
        context: context,
        title: 'Done',
        description: 'Password reset email sent successfully',
        type: ToastificationType.success,
      );

      emit(
        AuthPasswordResetSuccess(
          "Password reset email sent successfully",
          rememberMe: state.rememberMe,
        ),
      );
    } on FirebaseAuthException catch (e) {
      AppToast.showToast(
        context: context,
        title: 'Error',
        description: e.message ?? "Failed to send reset email",
        type: ToastificationType.error,
      );

      emit(
        AuthFailure(
          e.message ?? "Failed to send reset email",
          rememberMe: state.rememberMe,
        ),
      );
    }
  }

  //  Toggle Remember Me
  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(state.copyWith(rememberMe: value));
  }
}
