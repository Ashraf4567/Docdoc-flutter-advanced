import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/features/home/ui/cubit/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/ui/cubit/cubit/home_state.dart';
import 'package:flutter_advanced/features/home/ui/widgets/book_banner.dart';
import 'package:flutter_advanced/features/home/ui/widgets/speciality_section/doctor_speciality.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_section/recommended_doctors.dart';
import 'package:flutter_advanced/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (doctorsResponse, specializationsResponse) {
                  return Column(
                    children: [
                      HomeTopBar(name: 'Ahmed'),
                      BookBanner(),
                      verticalSpace(16),
                      DoctorSpeciality(
                        specializations: specializationsResponse.doctors,
                      ),
                      verticalSpace(16),
                      Expanded(
                        child: RecommendedDoctors(
                          doctors: doctorsResponse.data
                              .expand((s) => s.doctors)
                              .toList(),
                        ),
                      ),
                    ],
                  );
                },
                error: (error) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        error,
                        style: TextStyle(fontSize: 16.sp, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeCubit>().getHomeData();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
