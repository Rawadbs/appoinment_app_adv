import 'package:appoinment_app_adv/core/helpers/spacing.dart';
import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/genral.png",
      "assets/images/neurologic.png",
      "assets/images/pediatric.png",
      "assets/images/radiology.png",
    ];
    List<String> name = [
      "General",
      "Neurologic",
      "Pediatric",
      "Radiology",
    ];
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 40.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: ColorsManger.morelightergrey,
                  child: Image.asset(
                    images[index],
                    width: 24.w,
                  ),
                ),
                verticalSpace(8),
                Text(
                  name[index],
                  style: TextStyles.font13DarkBlueRegular,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
