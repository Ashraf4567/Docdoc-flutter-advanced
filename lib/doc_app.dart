import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/navigation/go_router.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theming/colors.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Color(0xFFFBFBFD),
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManager.gray.withValues(
                      alpha: 120,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: ColorsManager.mainBlue,
                        width: 1.3.w,
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        width: 1.3.w,
                        color: Color(0xFFEDEDED),
                      )
                  )
              ),
              useMaterial3: true,
              fontFamily: 'Inter'
          ),
        );
      },

    );
  }
}
