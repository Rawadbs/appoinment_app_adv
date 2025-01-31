import 'package:appoinment_app_adv/core/features/signup/data/models/sign_up_request_body.dart';
import 'package:appoinment_app_adv/core/features/signup/data/models/sign_up_response.dart';
import 'package:appoinment_app_adv/core/networking/api_error_handler.dart';
import 'package:appoinment_app_adv/core/networking/api_result.dart';
import 'package:appoinment_app_adv/core/networking/api_service.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);
  
  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
