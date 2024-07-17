import 'package:dio/dio.dart';
import 'package:json_placeholder_app_flutter/network/api_response.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  Future<ApiResponse<T>> get<T> (String url) async {
    try{
      final response = await dio.get(url);
      return ApiResponse.fromResponse(response);

    }catch(e){
      return ApiResponse(statusCode: 0, error: e.toString());
    }
  }
  
}