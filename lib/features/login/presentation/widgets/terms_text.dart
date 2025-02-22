import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'By logging in, you agree to our ',
                  style: TextStyles.font13GrayRegular.copyWith(
                      fontSize: 12.sp
                  )
              ),
              TextSpan(
                  text: 'Terms & Conditions ',
                  style: TextStyles.font16WhiteSemiBold.copyWith(
                      color: Colors.black,
                      fontSize: 13.sp
                  )
              ),
              TextSpan(
                  text: 'and ',
                  style: TextStyles.font13GrayRegular.copyWith(
                      fontSize: 13.sp
                  )
              ),
              TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyles.font16WhiteSemiBold.copyWith(
                      color: Colors.black,
                      fontSize: 13.sp
                  )
              ),
            ]
        ),
      ),
    );
  }
}
