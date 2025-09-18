import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/common/widget/Custom_button.dart';
import 'package:food/core/utils/app_icons.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/profile_field_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

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
              trailing: SizedBox(),
            ),

            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 25)),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
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
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      label: AppStrings.fullName,
                      hintText: "Norhan Walid",
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      label: AppStrings.email,
                      hintText: "norhanw@gmail.com",
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      label: AppStrings.phoneNumber,
                      hintText: "01152416400",
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: ProfileFieldWidget(
                      label: AppStrings.bio,
                      hintText: "I Love fast Food ",
                      heightt: 200,
                      isBio: true,
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 32)),
                  SliverToBoxAdapter(
                    child: CustomButton(text: AppStrings.save, ontap: () {}, onPressed: () {  },),
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
