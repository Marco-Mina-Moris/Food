import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {
  final bool rememberMe;
  const AuthState({this.rememberMe = false});

  AuthState copyWith({bool? rememberMe}) {
    if (this is AuthInitial) {
      return AuthInitial(rememberMe: rememberMe ?? this.rememberMe);
    } else if (this is AuthLoading) {
      return AuthLoading(rememberMe: rememberMe ?? this.rememberMe);
    } else if (this is AuthSuccess) {
      return AuthSuccess(
        (this as AuthSuccess).user,
        rememberMe: rememberMe ?? this.rememberMe,
      );
    } else if (this is AuthFailure) {
      return AuthFailure(
        (this as AuthFailure).message,
        rememberMe: rememberMe ?? this.rememberMe,
      );
    } else if (this is AuthPasswordResetSuccess) {
      return AuthPasswordResetSuccess(
        (this as AuthPasswordResetSuccess).message,
        rememberMe: rememberMe ?? this.rememberMe,
      );
    }
    return AuthInitial(rememberMe: rememberMe ?? this.rememberMe);
  }
}

class AuthInitial extends AuthState {
  const AuthInitial({super.rememberMe});
}

class AuthLoading extends AuthState {
  const AuthLoading({super.rememberMe});
}

class AuthSuccess extends AuthState {
  final User? user;
  const AuthSuccess(this.user, {super.rememberMe});
}

/// حالة الفشل
class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message, {super.rememberMe});
}

class AuthPasswordResetSuccess extends AuthState {
  final String message;
  const AuthPasswordResetSuccess(this.message, {super.rememberMe});
}
