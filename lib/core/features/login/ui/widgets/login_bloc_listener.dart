import 'package:appoinment_app_adv/core/features/login/logic/cubit/login_cubit.dart';
import 'package:appoinment_app_adv/core/features/login/logic/cubit/login_state.dart';
import 'package:appoinment_app_adv/core/helpers/extensions.dart';
import 'package:appoinment_app_adv/core/routing/routes.dart';
import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // show loading
            showDialog(
                context: context,
                builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsManger.primary,
                    )));
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, String error) {
    context.pop();
    // show error
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
              ),
              content: Text(
                error,
                style: TextStyles.font15DarkBlueMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Got it',
                    style: TextStyles.font14BlueSemiBold,
                  ),
                ),
              ],
            ));
  }
}
