import 'package:appoinment_app_adv/core/features/home/data/models/specializations_response_model.dart';
import 'package:appoinment_app_adv/core/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key,  this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return  DoctorsListViewItem(
            doctorModel: doctorsList?[index],
          );
        },
      ),
    );
  }
}
