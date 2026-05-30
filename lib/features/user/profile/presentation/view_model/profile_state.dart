import 'package:flutter/foundation.dart';
import 'package:food/features/auth/model/user_model.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  final UserModel user;
  const ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
}

class ProfileUpdating extends ProfileState {
  const ProfileUpdating();
}

class ProfileUpdateSuccess extends ProfileState {
  final UserModel user;
  const ProfileUpdateSuccess(this.user);
}

class ProfileUpdateFailure extends ProfileState {
  final String message;
  const ProfileUpdateFailure(this.message);
}
