import 'package:dartz/dartz.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';

abstract class JsonPlaceHolder {
  Future<Either<List<UserModel>, String>> getUsers();
}