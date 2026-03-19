import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/doctor_model.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_section/doctor_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsList extends StatelessWidget {
  final List<DoctorModel> doctors;
  const DoctorsList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: DoctorListItem(doctor: doctors[index]),
        );
      },
    );
  }
}
