import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/doctors_section/doctors_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedDoctors extends StatelessWidget {
  const RecommendedDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRecommendedDoctorsHeaderSection(),
        verticalSpace(16),
        Expanded(child: DoctorsList())
      ],
    );
  }

  _buildRecommendedDoctorsHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Recommended Doctors',
          style: TextStyles.font18BlackSemiBold,
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyles.font12BlueRegular.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.mainBlue,
            decorationThickness: 1.w,
          ),
        ),
      ],
    );
  }
}
