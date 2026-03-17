import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;

  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.contentPadding,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true, // to reduce the height of the TextFormField
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColors.moreLighterGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      cursorColor: Colors.black,
      cursorHeight: 20.h,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
