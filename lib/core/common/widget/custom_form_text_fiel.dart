import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';

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
    this.fillcolor,
    this.hintststyle,
    this.fillColor,
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

  final Color? fillcolor;
  final TextStyle? hintststyle;
  final Color? fillColor;

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
        fillColor: widget.fillColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: widget.hintststyle,
        errorMaxLines: 4,
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: widget.prefixIcon,
        prefix: widget.prefix,
        suffixIcon: GestureDetector(
          onTap: _toggleObscureText,

          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            // color: AppColor.gray,
            size: 27,
          ),
        ),
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
