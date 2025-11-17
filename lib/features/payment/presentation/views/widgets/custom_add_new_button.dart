import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';

class CustomAddNewButton extends StatelessWidget {
  const CustomAddNewButton({super.key, this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,

      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        minimumSize: Size(double.infinity, 62),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.paleBlue, // Set your desired border color here
            width: 2, // Optional: adjust border width
          ),
        ),
      ),
      child: SvgPicture.asset(Assets.assetsImagesAddnew),
    );
  }
}
