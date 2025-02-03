

import 'package:appoinment_app_adv/core/features/home/data/models/specializations_response_model.dart';
import 'package:appoinment_app_adv/core/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());


  
  void getSpecializations() async {
    emit(const HomeState.specializationloading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationssuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationerror(errorHandler));
      },
    );
  }

  // void getDoctorsList({required int? specializationId}) {
  //   List<Doctors?>? doctorsList =
  //       getDoctorsListBySpecializationId(specializationId);

  //   if (!doctorsList.isNullOrEmpty()) {
  //     emit(HomeState.doctorsSuccess(doctorsList));
  //   } else {
  //     emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
  //   }
  // }

  // /// returns the list of doctors based on the specialization id
  // getDoctorsListBySpecializationId(specializationId) {
  //   return specializationsList
  //       ?.firstWhere((specialization) => specialization?.id == specializationId)
  //       ?.doctorsList;
  // }
}
