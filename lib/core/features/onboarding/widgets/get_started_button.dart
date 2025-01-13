import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(ColorsManger.primary),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const WidgetStatePropertyAll(
            Size(double.infinity, 52),
          ),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ))),
      child: Text(
        'Get Started',
        style: TextStyles.font16white500Weight,
      ),
    );
  }
}
