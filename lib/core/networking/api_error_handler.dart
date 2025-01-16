import 'package:appoinment_app_adv/core/networking/api_constants.dart';
import 'package:appoinment_app_adv/core/networking/api_error_model.dart';
import 'package:dio/dio.dart';



class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      //default error
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  // dio error so its an error from response of the API or from dio itself
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONECTTION,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, api rejected request
  static const int FORBIDDEN = 403; // success with no data (no content)
  static const int UNAUTHORIZED = 401; // failure, user is not authorised
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in serverside
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONECTTION = -6;
  static const int DEFAULT = -7;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return ApiErrorModel(code:ResponseCode.SUCCESS,message:  ResponseMessage.success);
      case DataSource.NO_CONTENT:
        return ApiErrorModel(code:
            ResponseCode.NO_CONTENT,message:  ResponseMessage.noContent);

      case DataSource.BAD_REQUEST:
        return ApiErrorModel(code:
            ResponseCode.BAD_REQUEST,message:  ResponseMessage.badRequest);

      case DataSource.FORBIDDEN:
        return ApiErrorModel(code:ResponseCode.FORBIDDEN,message:  ResponseMessage.forebidden);

      case DataSource.UNAUTHORIZED:
        return ApiErrorModel(code:
            ResponseCode.UNAUTHORIZED,message:  ResponseMessage.unauthorized);

      case DataSource.NOT_FOUND:
        return ApiErrorModel(code:ResponseCode.NOT_FOUND,message:  ResponseMessage.notFound);

      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(code:ResponseCode.INTERNAL_SERVER_ERROR,
           message:  ResponseMessage.internalServerError);

      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(code:
            ResponseCode.CONNECT_TIMEOUT,message:  ResponseMessage.connectTimeOut);

      case DataSource.CANCEL:
        return ApiErrorModel(code:ResponseCode.CANCEL,message:  ResponseMessage.cancel);

      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(code:
            ResponseCode.RECIEVE_TIMEOUT,message:  ResponseMessage.rexiveTimeOut);

      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(code:
            ResponseCode.SEND_TIMEOUT,message:  ResponseMessage.sendTimeOut);

      case DataSource.CACHE_ERROR:
        return ApiErrorModel(code:
            ResponseCode.CACHE_ERROR,message:  ResponseMessage.cacheError);

      case DataSource.NO_INTERNET_CONECTTION:
        return ApiErrorModel(code:ResponseCode.NO_INTERNET_CONECTTION,
          message:   ResponseMessage.noInternet);
      case DataSource.DEFAULT:
        return ApiErrorModel(code:ResponseCode.DEFAULT,message:  ResponseMessage.defaultError);
    }
  }
}

class ResponseMessage {
  static String success = ApiErrors.succsess; // success with data
  static String noContent =
      ApiErrors.nocontent; // success with no data (no content)
  static String badRequest =
      ApiErrors.badrequesterror; // failure, api rejected request
  static String forebidden =
      ApiErrors.forbiddenerror; // success with no data (no content)
  static String unauthorized =
      ApiErrors.unauthorizederror; // failure, user is not authorised
  static String internalServerError =
      ApiErrors.internalservererror; // failure, crash in serverside
  static String notFound =
      ApiErrors.notfounderror; // failure, crash in serverside

  // local status code
  static String connectTimeOut = ApiErrors.timeouterror;
  static String cancel = ApiErrors.defaulterror;
  static String rexiveTimeOut = ApiErrors.timeouterror;
  static String sendTimeOut = ApiErrors.timeouterror;
  static String cacheError = ApiErrors.cacheerror;
  static String noInternet = ApiErrors.nointerneterror;
  static String defaultError = ApiErrors.defaulterror;
}

class ApiInternalSataus {
  static const int success = 0; // success with data
  static const int failure = 1; // FAILURE with data
}
