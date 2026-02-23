import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DocButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const DocButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ColorsManager.mainBlue),
          fixedSize: WidgetStatePropertyAll(Size(double.maxFinite, 52.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r)
          )
        )
      ),
      child: Text(
        text,
        style: TextStyles.font16WhiteSemiBold
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
