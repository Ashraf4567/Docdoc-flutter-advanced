import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/doctors_section/doctor_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: DoctorListItem(),
        );
      },
    );
  }
}
