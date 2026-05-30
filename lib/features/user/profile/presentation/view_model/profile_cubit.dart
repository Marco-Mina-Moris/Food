import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/data/remote_data/firebase_manger.dart';
import 'package:food/features/auth/model/user_model.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  Future<void> loadProfile() async {
    emit(const ProfileLoading());
    try {
      final currentUser = FirebaseManager.getCurrentUser();
      if (currentUser == null) {
        emit(const ProfileError("User is not logged in"));
        return;
      }
      
      UserModel? userModel = await FirebaseManager.readUserData(currentUser.uid);
      if (userModel == null) {
        // Document not present in Firestore, initialize a default one
        userModel = UserModel(
          id: currentUser.uid,
          email: currentUser.email ?? '',
          name: currentUser.displayName ?? 'New User',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          phone: '',
          bio: '',
        );
        await FirebaseManager.addUser(userModel);
      }
      emit(ProfileLoaded(userModel));
    } catch (e) {
      emit(ProfileError("Failed to load profile: $e"));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String bio,
  }) async {
    final currentState = state;
    UserModel? currentUserModel;
    if (currentState is ProfileLoaded) {
      currentUserModel = currentState.user;
    } else if (currentState is ProfileUpdateSuccess) {
      currentUserModel = currentState.user;
    }

    if (currentUserModel == null) {
      emit(const ProfileError("No user profile loaded to update"));
      return;
    }

    emit(const ProfileUpdating());
    try {
      final updatedUser = UserModel(
        id: currentUserModel.id,
        email: currentUserModel.email,
        name: name,
        createdAt: currentUserModel.createdAt,
        phone: phone,
        bio: bio,
      );

      await FirebaseManager.addUser(updatedUser);
      emit(ProfileUpdateSuccess(updatedUser));
      emit(ProfileLoaded(updatedUser)); // Re-emit loaded so UI displays the updated info
    } catch (e) {
      emit(ProfileUpdateFailure("Failed to update profile: $e"));
      // Re-emit loaded with previous data
      emit(ProfileLoaded(currentUserModel));
    }
  }
}
