import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/app_regex.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/widgets/app_text_input.dart';
import 'package:flutter_advanced/core/widgets/doc_button.dart';
import 'package:flutter_advanced/core/widgets/password_validations.dart';
import 'package:flutter_advanced/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter_advanced/features/signup/ui/widgets/gender_selection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isConfirmationPasswordMatch = false;

  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    final passwordController = context.read<SignupCubit>().passwordController;
    final passwordConfirmationController =
        context.read<SignupCubit>().passwordConfirmationController;

    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
      _checkConfirmationMatch(
          passwordController.text, passwordConfirmationController.text);
    });

    passwordConfirmationController.addListener(() {
      _checkConfirmationMatch(
          passwordController.text, passwordConfirmationController.text);
    });
  }

  void _checkConfirmationMatch(String password, String confirmation) {
    setState(() {
      isConfirmationPasswordMatch =
          confirmation.isNotEmpty && password == confirmation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppFormTextField(
            controller: context.read<SignupCubit>().nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppFormTextField(
            controller: context.read<SignupCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppFormTextField(
            controller: context.read<SignupCubit>().phoneController,
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppFormTextField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              if (!AppRegex.isPasswordValid(value)) {
                return 'Password must be at least 8 chars with uppercase, lowercase, numbers, and symbols';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppFormTextField(
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value !=
                  context.read<SignupCubit>().passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          verticalSpace(16),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
            isConfirmationPasswordMatch: isConfirmationPasswordMatch,
          ),
          verticalSpace(16),
          GenderSelection(
            onGenderSelected: (gender) {
              context.read<SignupCubit>().selectedGender = gender;
            },
          ),
          verticalSpace(16),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return DocButton(
                text: 'Sign Up',
                isLoading: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                onPressed: () {
                  if (context
                      .read<SignupCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<SignupCubit>().emitSignupStates();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
