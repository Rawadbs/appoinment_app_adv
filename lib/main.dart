import 'package:appoinment_app_adv/core/di/dependency_injection.dart';
import 'package:appoinment_app_adv/core/routing/app_router.dart';
import 'package:appoinment_app_adv/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
