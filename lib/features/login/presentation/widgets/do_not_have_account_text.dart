import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'Don\'t have an account yet? ',
                  style: TextStyles.font16WhiteSemiBold.copyWith(
                      color: ColorsManager.gray,
                      fontSize: 13.sp
                  )
              ),
              TextSpan(
                  text: 'Sign Up',
                  style: TextStyles.font16WhiteSemiBold.copyWith(
                      color: ColorsManager.mainBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp
                  )
              )
            ]
        ),
      ),
    );
  }
}
