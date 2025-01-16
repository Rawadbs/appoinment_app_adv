import 'package:appoinment_app_adv/core/di/dependency_injection.dart';
import 'package:appoinment_app_adv/core/features/login/logic/cubit/login_cubit.dart';
import 'package:appoinment_app_adv/core/features/login/ui/login_screen.dart';
import 'package:appoinment_app_adv/core/features/onboarding/onbarding_screen.dart';
import 'package:appoinment_app_adv/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnbardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const OnbardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      // Add more routes here
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('No route defined')),
                ));
    }
  }
}
