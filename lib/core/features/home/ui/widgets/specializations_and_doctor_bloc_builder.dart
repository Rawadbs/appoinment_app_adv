import 'package:appoinment_app_adv/core/features/home/logic/home_cubit.dart';
import 'package:appoinment_app_adv/core/features/home/logic/home_state.dart';
import 'package:appoinment_app_adv/core/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/spacing.dart';
import 'doctors_list_view.dart';

class SpecializationsAndDoctorBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Specializationloading ||
          current is SpecializationsSuccess ||
          current is Specializationerror,
      builder: (context, state) {
        return state.maybeWhen(
          specializationloading: () {
            return setupLoading();
          },
          specializationssuccess: (specializationResponseModel) {
            var specializationsList =
                specializationResponseModel.specializationDataList;
            return setupSuccess(specializationsList);
          },
          specializationerror: (errorhandler) {
            return setupError();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
              specializationsDataList: specializationsList ?? []),
          verticalSpace(8),
          DoctorsListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }
}
