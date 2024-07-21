import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:json_placeholder_app_flutter/feature/data/post_model.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';
import 'package:json_placeholder_app_flutter/feature/domain/json_placeholder_repo.dart';
import 'package:json_placeholder_app_flutter/network/api_client.dart';
import 'package:json_placeholder_app_flutter/utils/consts.dart';

class JsonPlaceholderRepoImpl extends JsonPlaceHolder{
  @override
  Future<Either<List<UserModel>, String>> getUsers() async {
    var dio = Dio();
    var url = Consts.baseUrl + Consts.users;
    var apiClient = ApiClient(dio: dio);
    var response = await apiClient.get(url);
    return response.result.fold((l) {
            var userList = (l as List).map((json) => UserModel.fromJson(json)).toList();
return Left(userList);

    }, (r) => Right(r));
 
  }
  
  @override
  Future<Either<List<PostModel>, String>> getPosts({required int userId}) async {
    var dio = Dio();
    var url = Consts.baseUrl +Consts.users + Consts.posts(userId: userId);
    var apiClient = ApiClient(dio: dio);
    var response = await apiClient.get(url);
    return response.result.fold((l) {
      var postList = (l as List).map((e) => PostModel.fromJson(e)).toList();
      return Left(postList);
    }, (r) => Right(r));
  }



}