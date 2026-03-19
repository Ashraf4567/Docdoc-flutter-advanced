import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/home/data/models/doctor_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListItem extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorListItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
            height: 112.h,
            width: 96.w,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 112.h,
                width: 96.w,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Icon(Icons.person, size: 40),
              );
            },
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: TextStyles.font18BlackSemiBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${doctor.degree} | ${doctor.specialization.name}',
                style: TextStyles.font12GrayMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
