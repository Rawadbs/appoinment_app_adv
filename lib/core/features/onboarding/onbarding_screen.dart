import 'package:appoinment_app_adv/core/features/onboarding/widgets/doc_image_and_text.dart';
import 'package:appoinment_app_adv/core/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:appoinment_app_adv/core/features/onboarding/widgets/get_started_button.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbardingScreen extends StatelessWidget {
  const OnbardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 30.h),
                const DocImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily  with Docdoc to get a new experience.',
                        textAlign: TextAlign.center,
                        style: TextStyles.font13greyRegular,
                      ),
                      SizedBox(height: 30.h),
                      const GetStartedButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
