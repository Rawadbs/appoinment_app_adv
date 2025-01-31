import 'package:appoinment_app_adv/core/helpers/extensions.dart';
import 'package:appoinment_app_adv/core/routing/routes.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PushHome extends StatelessWidget {
  const PushHome({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'login as guest',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' skip',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.homeScreen);
              },
          ),
        ],
      ),
    );
  }
}
