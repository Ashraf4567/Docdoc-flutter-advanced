import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(const DocApp());
}
