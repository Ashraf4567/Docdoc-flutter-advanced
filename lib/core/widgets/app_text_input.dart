import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  const AppFormTextField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.hintStyle,
    this.inputTextStyle,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        isDense: true,
        fillColor: ColorsManager.moreLightGray,
        filled: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsManager.mainBlue, width: 1.3),
                borderRadius: BorderRadius.circular(16.r)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsManager.lightGray, width: 1.3),
                borderRadius: BorderRadius.circular(16.r)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMeduim,
    );
  }
}
