import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/core/widgets/app_text_input.dart';
import 'package:flutter_advanced/core/widgets/doc_button.dart';
import 'package:flutter_advanced/features/login/presentation/widgets/terms_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/do_not_have_account_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordObscure = true;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 94.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24Black700Weight
                    .copyWith(color: ColorsManager.mainBlue),
              ),
              verticalSpace(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font13GrayRegular,
              ),
              SizedBox(
                height: 36.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppFormTextField(hintText: 'Email'),
                    SizedBox(height: 16.h),
                    AppFormTextField(
                      hintText: 'Password',
                      isObscureText: isPasswordObscure,
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(16),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.font13BlueRegular
                ),
              ),
              verticalSpace(32),
              DocButton(
                  text: 'Login',
                  onPressed: () {}),
              verticalSpace(24),
              const TermsText(),
              verticalSpace(24),
              const DoNotHaveAccountText()
            ],
          )),
    )));
  }
}
