import 'package:flutter/material.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const DocApp());
}
