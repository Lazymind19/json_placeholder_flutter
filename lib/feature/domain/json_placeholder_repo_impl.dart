import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';
import 'package:json_placeholder_app_flutter/feature/domain/json_placeholder_repo.dart';
import 'package:json_placeholder_app_flutter/network/api_client.dart';
import 'package:json_placeholder_app_flutter/utils/consts.dart';

class JsonPlaceholderRepoImpl extends JsonPlaceHolder{
  @override
  Future<Either<UserModel, String>> getUsers() async {
    var dio = Dio();
    var url = Consts.baseUrl + Consts.users;
    var apiClient = ApiClient(dio: dio);
    var response = await apiClient.get(url);
    return response.result.fold((l) {
      var model = UserModel.fromJson(l);
      return Left(UserModel(
        address: model.address,
        company: model.company,
        email: model.email,
        id: model.id,
         name: model.name,
         phone: model.phone,
         username: model.username,
         website: model.website,

      ));
    }, (r) => Right(r));
 
  }

}