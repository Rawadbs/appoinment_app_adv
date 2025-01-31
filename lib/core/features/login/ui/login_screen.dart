import 'package:appoinment_app_adv/core/features/login/logic/cubit/login_cubit.dart';
import 'package:appoinment_app_adv/core/features/login/ui/widgets/dont_have_account.dart';
import 'package:appoinment_app_adv/core/features/login/ui/widgets/email_and_password.dart';
import 'package:appoinment_app_adv/core/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:appoinment_app_adv/core/features/login/ui/widgets/push_home.dart';
import 'package:appoinment_app_adv/core/features/login/ui/widgets/terms_and_condtion.dart';
import 'package:appoinment_app_adv/core/helpers/spacing.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:appoinment_app_adv/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14greyRegular,
              ),
              verticalSpace(36),
              Column(
                children: [
                  const EmailAndPassword(),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forgot Password',
                      style: TextStyles.font13BlueRegular,
                    ),
                  ),
                  verticalSpace(40),
                  AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemibold,
                      onPressed: () {
                        validateThenLogin(context);
                      }),
                  verticalSpace(16),
                  const TermsAndConditionsText(),
                  verticalSpace(60),
                  const DontHaveAccountText(),
                  verticalSpace(16),
                  const PushHome(),
                  const LoginBlocListener()
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
