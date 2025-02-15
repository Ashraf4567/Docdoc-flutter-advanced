import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/onboarding/widgets/get_start_button.dart';
import 'package:flutter_advanced/features/onboarding/widgets/logo_with_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doc_image_with_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const LogoWithText(),
                SizedBox(height: 41.h,),
                const DocImageWithText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:  32.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font13GrayRegular.copyWith(fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.h,),
                      GetStartButton(),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
