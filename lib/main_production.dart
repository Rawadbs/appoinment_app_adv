import 'package:appoinment_app_adv/core/di/dependency_injection.dart';
import 'package:appoinment_app_adv/core/helpers/constants.dart';
import 'package:appoinment_app_adv/core/helpers/extensions.dart';
import 'package:appoinment_app_adv/core/helpers/shared_pref_helper.dart';
import 'package:appoinment_app_adv/core/routing/app_router.dart';
import 'package:appoinment_app_adv/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedinUser = true;
  } else {
    isLoggedinUser = false;
  }
}
