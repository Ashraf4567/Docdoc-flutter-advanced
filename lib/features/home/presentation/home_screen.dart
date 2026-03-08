import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/book_banner.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/speciality_section/doctor_speciality.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/doctors_section/recommended_doctors.dart';
import 'package:flutter_advanced/features/home/presentation/widgets/home_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              HomeTopBar(name: 'Ahmed'),
              BookBanner(),
              verticalSpace(16),
              DoctorSpeciality(),
              verticalSpace(16),
              Expanded(child: RecommendedDoctors())
            ],
          ),
        ),
      ),
    );
  }
}
