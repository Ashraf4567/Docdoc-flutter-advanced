import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_request_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelection extends StatefulWidget {
  final ValueChanged<Gender> onGenderSelected;

  const GenderSelection({super.key, required this.onGenderSelected});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  // Default to Male
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildGenderCard(
            gender: Gender.male,
            icon: Icons.male_rounded,
            title: 'Male',
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildGenderCard(
            gender: Gender.female,
            icon: Icons.female_rounded,
            title: 'Female',
          ),
        ),
      ],
    );
  }

  Widget _buildGenderCard({
    required Gender gender,
    required IconData icon,
    required String title,
  }) {
    final isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
        widget.onGenderSelected(gender);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.lightBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isSelected ? ColorsManager.mainBlue : ColorsManager.lightGray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? ColorsManager.mainBlue : ColorsManager.gray,
              size: 24.sp,
            ),
            horizontalSpace(8),
            Text(
              title,
              style: isSelected
                  ? TextStyles.font14DarkBlueMeduim.copyWith(
                      color: ColorsManager.mainBlue,
                      fontWeight: FontWeight.bold,
                    )
                  : TextStyles.font14LightGrayRegular.copyWith(
                      color: ColorsManager.gray,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
