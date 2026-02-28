import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/core/widgets/app_text_input.dart';
import 'package:flutter_advanced/core/widgets/doc_button.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/presentation/widgets/Login_bloc_listener.dart';
import 'package:flutter_advanced/features/login/presentation/widgets/email_and_password.dart';
import 'package:flutter_advanced/features/login/presentation/widgets/terms_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/do_not_have_account_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect if keyboard is open
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 94.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Collapse header when keyboard is open
              ClipRect(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isKeyboardOpen ? 0.0 : 1.0,
                    child: SizedBox(
                      height: isKeyboardOpen ? 0 : null,
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
                          SizedBox(height: 36.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              EmailAndPassword(),
              verticalSpace(16),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text('Forgot Password?',
                    style: TextStyles.font13BlueRegular),
              ),
              verticalSpace(32),
              DocButton(
                  text: 'Login',
                  onPressed: () {
                    validateThenLogin(context);
                  }),
              verticalSpace(24),
              const TermsText(),
              verticalSpace(24),
              const DoNotHaveAccountText(),
              const LoginBlocListener()
            ],
          )),
    )));
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
