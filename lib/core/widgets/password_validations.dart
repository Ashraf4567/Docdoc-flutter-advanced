import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  final bool? isConfirmationPasswordMatch;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
    this.isConfirmationPasswordMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValidationRow('At least 1 lowercase letter', hasLowerCase),
        const SizedBox(height: 2),
        ValidationRow('At least 1 uppercase letter', hasUpperCase),
        const SizedBox(height: 2),
        ValidationRow('At least 1 special character', hasSpecialCharacters),
        const SizedBox(height: 2),
        ValidationRow('At least 1 number', hasNumber),
        const SizedBox(height: 2),
        ValidationRow('At least 8 characters long', hasMinLength),
        const SizedBox(height: 2),
        isConfirmationPasswordMatch != null
            ? ValidationRow('Passwords match', isConfirmationPasswordMatch!)
            : const SizedBox.shrink(),
      ],
    );
  }
}

class ValidationRow extends StatelessWidget {
  final String text;
  final bool hasValidated;

  const ValidationRow(this.text, this.hasValidated, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Animated icon: gray dot → green checkmark
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeOutBack,
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: hasValidated
              ? const Icon(Icons.check_circle,
                  size: 16, color: Colors.green, key: ValueKey(true))
              : const Icon(Icons.circle,
                  size: 8, color: ColorsManager.gray, key: ValueKey(false)),
        ),
        const SizedBox(width: 6),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          style: TextStyles.font13GrayRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
          child: Text(text),
        )
      ],
    );
  }
}
