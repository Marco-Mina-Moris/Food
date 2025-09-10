import 'package:flutter/material.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.keyboardType,
    this.suffixWidget,
    this.prefixIcon,
    this.prefix,
    this.action,
    this.focusNode,
    this.borderRadius,
    this.enable = true,
  });
  final TextEditingController? controller;
  final bool isPassword;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final Widget? suffixWidget, prefixIcon, prefix;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final bool? enable;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  void _toggleObscureText() {
    setState(() => obscureText = !obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      enabled: widget.enable,
      onChanged: (text) {
        widget.onChanged?.call(text);
      },
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      obscureText: obscureText,

      keyboardType: widget.keyboardType,
      // inputFormatters: widget.inputFormatters,
      textInputAction: widget.action ?? TextInputAction.next,
      focusNode: widget.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: 16,
        // color: AppColor.primary,
        fontWeight: FontWeight.w500,
      ),

      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.sen(
          fontSize: 14,
          color: Color(0xffA0A5BA),
          fontWeight: FontWeight.w400,
        ),
        errorMaxLines: 4,
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: widget.prefixIcon,
        prefix: widget.prefix,
        suffixIcon:
            widget.isPassword
                ? GestureDetector(
                  onTap: _toggleObscureText,
                  child: Image.asset(
                    obscureText ? AssetsConstants.eyeOff : AssetsConstants.eye,
                  ),
                )
                : widget.suffixWidget,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 14,
        ),
        border: outlineInputBorder(color: Colors.transparent, width: 1),
        enabledBorder: outlineInputBorder(color: Color(0xfff0f5fa), width: 1),
        focusedBorder: outlineInputBorder(color: Color(0xffF0F5FA), width: 1),
        errorBorder: outlineInputBorder(color: Colors.red, width: 1),
        focusedErrorBorder: outlineInputBorder(color: Colors.red, width: 1),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({
    required Color color,
    required double width,
  }) {
    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
