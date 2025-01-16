import 'package:appoinment_app_adv/core/helpers/spacing.dart';
import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumbers;
  final bool hasMinLength;
  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumbers,
      required this.hasMinLength});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 upercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character letter', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 1 number ', hasNumbers),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManger.grey,
        ),
        horizntalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color:
                  hasValidated ? ColorsManger.grey : ColorsManger.darkprimary),
        ),
      ],
    );
  }
}
