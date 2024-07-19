import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';
import 'package:json_placeholder_app_flutter/feature/domain/json_placeholder_repo_impl.dart';

import '../../../data/photo_model.dart';
import '../../../data/post_model.dart';
import '../../../data/todo_model.dart';

part 'json_place_holder_event.dart';
part 'json_place_holder_state.dart';

class JsonPlaceHolderBloc extends Bloc<JsonPlaceHolderEvent, JsonPlaceHolderState> {
  JsonPlaceHolderBloc() : super(JsonPlaceHolderInitial()) {
    on<JsonPlaceHolderFetchUserEvent>(jsonPlaceHolderFetchUserEvent);

  }

  Future<FutureOr<void>> jsonPlaceHolderFetchUserEvent(JsonPlaceHolderFetchUserEvent event, Emitter<JsonPlaceHolderState> emit) async {
  try{
    emit(JsonPlaceHolderLoadingState());
    var repo = JsonPlaceholderRepoImpl();
    var response = await repo.getUsers();
    response.fold((l) => emit(JsonPlaceHolderFetchUserSuccessState(userModels: l)),
     (r) => emit(JsonPlaceHolderFailureState(errorMessge: r)));
  }catch(e){
    emit(JsonPlaceHolderFailureState(errorMessge: e.toString()));
  }
  }
}
