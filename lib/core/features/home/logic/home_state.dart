import 'package:appoinment_app_adv/core/features/home/data/models/specializations_response_model.dart';
import 'package:appoinment_app_adv/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part  'home_state.freezed.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  // specializations
  const factory HomeState.specializationloading() = Specializationloading;
  const factory HomeState.specializationerror(ErrorHandler errorhandler) = Specializationerror;
  const factory HomeState.specializationssuccess(SpecializationsResponseModel specializationsResponseModel) = SpecializationsSuccess;
}
