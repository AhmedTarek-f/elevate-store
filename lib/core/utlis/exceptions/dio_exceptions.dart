import 'package:dio/dio.dart';
import 'package:elevate_store/core/constants/app_text.dart';
import 'package:elevate_store/core/utlis/exceptions/failure.dart';

class DioExceptions extends Failure {
  DioExceptions({required super.errorMessage});
  factory DioExceptions.handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return DioExceptions(errorMessage: AppText.connectionTimeout);
        case DioExceptionType.sendTimeout:
          return DioExceptions(errorMessage: AppText.sendTimeout);
        case DioExceptionType.receiveTimeout:
          return DioExceptions(errorMessage: AppText.receiveTimeout);
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return DioExceptions(errorMessage: AppText.requestCancelled);
        case DioExceptionType.unknown:
          return DioExceptions(errorMessage: AppText.networkError);
        default:
          return DioExceptions(errorMessage: AppText.unexpectedErrorOccurred);
      }
    } else {
      return DioExceptions(
        errorMessage: "${AppText.unexpectedError} ${error.toString()}",
      );
    }
  }

  static DioExceptions _handleBadResponse(Response? response) {
    if (response == null) {
      return DioExceptions(errorMessage: AppText.noResponseReceivedMessage);
    }
    switch (response.statusCode) {
      case 400:
        return DioExceptions(errorMessage: AppText.badRequest);
      case 401:
        return DioExceptions(errorMessage: AppText.unauthorized);
      case 403:
        return DioExceptions(errorMessage: AppText.forbidden);
      case 404:
        return DioExceptions(errorMessage: AppText.noResources);
      case 500:
        return DioExceptions(errorMessage: AppText.internalServerError);
      default:
        return DioExceptions(
          errorMessage:
              "${AppText.error} ${response.statusCode}: ${response.data["message"]}",
        );
    }
  }
}
