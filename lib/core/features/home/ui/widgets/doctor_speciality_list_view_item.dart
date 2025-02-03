import 'package:appoinment_app_adv/core/features/home/data/models/specializations_response_model.dart';
import 'package:appoinment_app_adv/core/helpers/spacing.dart';
import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  const DoctorSpecialityListViewItem({super.key, this.specializationsData, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 40.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: ColorsManger.morelightergrey,
            child: Image.asset(
              'assets/images/genral.png',
              width: 24.w,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.name??'Specializations',
            style: TextStyles.font13DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
