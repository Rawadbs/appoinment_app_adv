import 'package:appoinment_app_adv/core/features/login/data/models/login_request_body.dart';
import 'package:appoinment_app_adv/core/features/login/data/models/login_response.dart';
import 'package:appoinment_app_adv/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
