import 'package:appoinment_app_adv/core/features/login/logic/cubit/login_cubit.dart';
import 'package:appoinment_app_adv/core/features/login/ui/widgets/password_validations.dart';
import 'package:appoinment_app_adv/core/helpers/app_regex.dart';
import 'package:appoinment_app_adv/core/helpers/spacing.dart';
import 'package:appoinment_app_adv/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordContoller;
  bool isObsecureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumbers = false;
  bool hasMinLength = false;
  @override
  void initState() {
    super.initState();
    passwordContoller = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordContoller.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordContoller.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordContoller.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordContoller.text);
        hasNumbers = AppRegex.hasNumber(passwordContoller.text);
        hasMinLength = AppRegex.hasMinLength(passwordContoller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'password',
            isObscureText: isObsecureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecureText = !isObsecureText;
                });
              },
              child: Icon(
                  isObsecureText ? Icons.visibility_off : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumbers: hasNumbers,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordContoller.dispose();
    super.dispose();
  }
}
