import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate_store/core/utlis/exceptions/dio_exceptions.dart';
import 'package:elevate_store/core/utlis/exceptions/failure.dart';

abstract class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com",
      headers: {"Content-Type": "application/json"},
    ),
  );

  // GET Request
  static Future<Either<Failure, Response>> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return right(response);
    } catch (error) {
      return left(DioExceptions.handleError(error));
    }
  }
}
