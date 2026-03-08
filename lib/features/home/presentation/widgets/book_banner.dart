import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/font_weight_helper.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookBanner extends StatelessWidget {
  const BookBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          width: double.infinity,
          height: 165.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: DecorationImage(
                image: AssetImage('assets/images/home_blue_pattern.png'),
                fit: BoxFit.cover,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Book and\n schedule with\n nearest doctor',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.medium,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Text(
                  'Find Nearby',
                  style: TextStyles.font13BlueRegular.copyWith(fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            right: 8,
            child: Image.asset(
              'assets/images/home_doctor.png',
              height: 200.h,
            ))
      ]),
    );
  }
}
