import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/speciality_section/doctor_speciality_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSpecialitySectionHeader(),
        verticalSpace(16),
        DoctorSpecialityList()

      ],
    );
  }
  
  _buildSpecialitySectionHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18BlackSemiBold,
        ),
        Text(
          'See All',
          style: TextStyles.font12BlueRegular.copyWith(
            //underline the text
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.mainBlue,
            decorationThickness: 1.w
          ),
        )
      ],
    );
  }
}