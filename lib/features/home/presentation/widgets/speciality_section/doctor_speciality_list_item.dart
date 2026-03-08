import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecialityListItem extends StatelessWidget {
  const DoctorSpecialityListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(
            'assets/svgs/doc_avatar.svg',
            height: 25.h,
            width: 40.w,
          ),
        ),
        Text(
          'Dentist',
          style: TextStyles.font12BlueRegular.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
