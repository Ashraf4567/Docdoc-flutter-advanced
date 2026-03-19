import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_doctors.dart';
import 'package:flutter_advanced/features/home/ui/widgets/speciality_section/doctor_speciality_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityList extends StatelessWidget {
  final List<SpecializationDoctors> specializations;
  const DoctorSpecialityList({super.key, required this.specializations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: specializations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: DoctorSpecialityListItem(
                specialization: specializations[index],
              ),
            );
          }),
    );
  }
}
