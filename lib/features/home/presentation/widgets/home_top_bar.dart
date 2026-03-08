import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/font_weight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  final String name;
  const HomeTopBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, $name!',
                style: TextStyle(
                    fontSize: 18.sp, fontWeight: FontWeightHelper.bold)),
            Text('How are you today?',
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: ColorsManager.gray)),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset('assets/svgs/alert_icon.svg'),
        )
      ],
    );
  }
}
