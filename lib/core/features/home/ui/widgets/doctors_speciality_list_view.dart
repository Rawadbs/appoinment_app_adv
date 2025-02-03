import 'package:appoinment_app_adv/core/features/home/data/models/specializations_response_model.dart';
import 'package:appoinment_app_adv/core/features/home/ui/widgets/doctor_speciality_list_view_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorsSpecialityListView(
      {super.key, required this.specializationsDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: specializationsDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DoctorSpecialityListViewItem(
            specializationsData: specializationsDataList[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
