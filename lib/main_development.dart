import 'package:appoinment_app_adv/core/di/dependency_injection.dart';
import 'package:appoinment_app_adv/core/routing/app_router.dart';
import 'package:appoinment_app_adv/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
