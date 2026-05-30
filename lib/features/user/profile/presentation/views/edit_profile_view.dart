import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/utils/app_icons.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/features/user/profile/presentation/views/widgets/profile_field_widget.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_cubit.dart';
import 'package:food/features/user/profile/presentation/view_model/profile_state.dart';
import 'package:food/core/dialogs/app_toasts.dart';
import 'package:toastification/toastification.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    bioController = TextEditingController();

    final state = context.read<ProfileCubit>().state;
    if (state is ProfileLoaded) {
      nameController.text = state.user.name ?? "";
      emailController.text = state.user.email ?? "";
      phoneController.text = state.user.phone ?? "";
      bioController.text = state.user.bio ?? "";
    } else if (state is ProfileUpdateSuccess) {
      nameController.text = state.user.name ?? "";
      emailController.text = state.user.email ?? "";
      phoneController.text = state.user.phone ?? "";
      bioController.text = state.user.bio ?? "";
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBarWidget(
              title: AppStrings.editProfile,
              trailing: const SizedBox(),
            ),

            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 25)),
                  SliverToBoxAdapter(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5D1C0), // Light peach color
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          top: 95,
                          left: 200,
                          child: SvgPicture.asset(
                            AppIcons.assetsIconsEditicon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      controller: nameController,
                      label: AppStrings.fullName,
                      hintText: "Norhan Walid",
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      controller: emailController,
                      readOnly: true,
                      label: AppStrings.email,
                      hintText: "norhanw@gmail.com",
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      controller: phoneController,
                      label: AppStrings.phoneNumber,
                      hintText: "01152416400",
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      controller: bioController,
                      label: AppStrings.bio,
                      hintText: "I Love fast Food",
                      heightt: 200,
                      isBio: true,
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 32)),
                  SliverToBoxAdapter(
                    child: BlocConsumer<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is ProfileUpdateSuccess) {
                          AppToast.showToast(
                            context: context,
                            title: "Success",
                            description: "Profile updated successfully",
                            type: ToastificationType.success,
                          );
                          Navigator.pop(context);
                        } else if (state is ProfileUpdateFailure) {
                          AppToast.showToast(
                            context: context,
                            title: "Error",
                            description: state.message,
                            type: ToastificationType.error,
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is ProfileUpdating;
                        return CustomButton(
                          text: isLoading ? "Saving..." : AppStrings.save,
                          onPressed: () {
                            if (!isLoading) {
                              context.read<ProfileCubit>().updateProfile(
                                    name: nameController.text.trim(),
                                    phone: phoneController.text.trim(),
                                    bio: bioController.text.trim(),
                                  );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
