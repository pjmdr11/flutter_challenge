import 'package:dio/dio.dart';
import 'package:flutter_challenge/src/data/models/app_exception_model.dart';

class ErrorUtils {
  static AppException generateErrorDetails(dynamic e, {int code = 0}) {
    String errorDescription = "Something went wrong";
    int statusCode = code;
    if (e is DioException) {
      statusCode = e.response?.statusCode ?? 400;
      switch (e.type) {
        case DioExceptionType.sendTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription =
              "Connection timeout with API server.Please check your internet connection.";
          break;

        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          errorDescription =
              "Connection to API server failed due to internet connection.Please check your internet connection.";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;

        default:
          errorDescription = "Something went wrong.";
          break;
      }

      switch (statusCode) {
        case 400:
          return BadRequestException(errorDescription, statusCode: statusCode);
        case 401:
        case 403:
          errorDescription = "User session expired!! Please login again.";
          return UnauthorisedException(errorDescription,
              statusCode: statusCode);
        case 404:
          return BadRequestException(errorDescription, statusCode: statusCode);
        case 500:
          return FetchDataException(errorDescription, statusCode: statusCode);
        default:
          return FetchDataException(errorDescription, statusCode: statusCode);
      }
    } else {
      errorDescription = e.toString();
    }

    return AppException(
        code: statusCode.toString(),
        message: errorDescription,
        statusCode: statusCode);
  }
}
