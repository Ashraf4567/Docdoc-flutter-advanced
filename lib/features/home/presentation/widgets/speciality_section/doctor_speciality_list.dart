import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/speciality_section/doctor_speciality_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityList extends StatelessWidget {
  const DoctorSpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: const DoctorSpecialityListItem(),
            );
          }),
    );
  }
}
