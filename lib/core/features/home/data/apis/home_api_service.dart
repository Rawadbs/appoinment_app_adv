import 'package:appoinment_app_adv/core/features/home/data/apis/home_api_constants.dart';
import 'package:appoinment_app_adv/core/features/home/data/models/specializations_response_model.dart';
import 'package:appoinment_app_adv/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';
@RestApi(baseUrl:ApiConstants.apiBaseUrl )
abstract class HomeApiService {
  factory HomeApiService (Dio dio,)=_HomeApiService;
  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}