import 'package:appoinment_app_adv/core/features/onboarding/onbarding_screen.dart';
import 'package:appoinment_app_adv/core/helpers/constants.dart';
import 'package:appoinment_app_adv/core/routing/app_router.dart';
import 'package:appoinment_app_adv/core/routing/routes.dart';
import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: ColorsManger.primary,
            scaffoldBackgroundColor: Colors.white),
        initialRoute:
            isLoggedinUser ? Routes.homeScreen : Routes.onBoardingScreen,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
