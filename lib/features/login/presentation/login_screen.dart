import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/core/widgets/doc_button.dart';
import 'package:flutter_advanced/features/login/presentation/widgets/login_text_input.dart';
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
  bool isTermsChecked = false;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _validateCheckbox(){
    return isTermsChecked;
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
                  style: TextStyles.font24Black700Weight.copyWith(
                    color: ColorsManager.mainBlue
                  ),
                ),
                SizedBox(height: 8.h,),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font13GrayRegular,
                ),
                SizedBox(height: 36.h,),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      LoginTextInput(
                        hintText: 'Email',
                        controller: emailController,
                        errorText: 'Please enter your email',
                      ),
                      SizedBox(height: 16.h,),
                      LoginTextInput(
                        hintText: 'Password',
                        controller: passwordController,
                        isPassword: true,
                        errorText: 'Please enter your password',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r)
                      ),

                      activeColor: ColorsManager.mainBlue,
                      checkColor: Colors.white,
                      value: isTermsChecked, onChanged: (value) {
                        setState(() {
                        isTermsChecked = value!;
                      });
                    },),
                    Text(
                      'Remember me',
                      style: TextStyles.font13GrayRegular.copyWith(
                        fontSize: 12.sp,
                        color: Color(0xFFA9B2B9)
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Forgot Password?',
                      style: TextStyles.font13GrayRegular.copyWith(
                        color: ColorsManager.mainBlue,
                        fontSize: 12.sp
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32.h,),
                DocButton(text: 'Login' , onPressed: () {
                  if (formKey.currentState!.validate() && _validateCheckbox()) {

                  }
                }),
                SizedBox(height: 24.h,),
                const TermsText(),
                SizedBox(height: 24.h,),
                const DoNotHaveAccountText()
              ],
            )
          ),
        )
      )
    );
  }
}
