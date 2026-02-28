import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;
  const DocButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // If isLoading is true, onPressed becomes null which automatically
      // disables the TextButton and fades its colors in Flutter.
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            // Give it a gray color when disabled (loading), mainBlue otherwise
            if (states.contains(WidgetState.disabled)) {
              return ColorsManager.lightGray;
            }
            return ColorsManager.mainBlue;
          }),
          fixedSize: WidgetStatePropertyAll(Size(double.maxFinite, 52.h)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r)))),
      child: isLoading
          ? SizedBox(
              height: 24.h,
              width: 24.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              text,
              style: TextStyles.font16WhiteSemiBold
                  .copyWith(fontWeight: FontWeight.bold),
            ),
    );
  }
}
