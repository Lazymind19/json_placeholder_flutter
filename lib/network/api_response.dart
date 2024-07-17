import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiResponse<T> {
  final int statusCode;
  final T? data;
  final String? error;

  ApiResponse({required this.statusCode, this.data, this.error});

  factory ApiResponse.fromResponse(Response response) {
    return ApiResponse<T>(
        statusCode: response.statusCode ?? 0,
        data: response.statusCode == 200 ? response.data as T? : null,
        error: response.statusCode != 200
            ? "Something went wrong. Please try again"
            : null);
  }

  bool get isSuccess => statusCode == 200;

  Either<T, String> get result {
    if (isSuccess) {
      return Left(data as T);
    } else {
      return Right(error ?? "Something error found");
    }
  }
}
