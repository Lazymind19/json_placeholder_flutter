import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_placeholder_app_flutter/feature/data/album_model.dart';
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
    on<JsonPlaceHolderFetchPostEvent>(jsonPlaceHolderFetchPostEvent);
    on<JsonPlaceHolderFetchAlbumEvent>(jsonPlaceHolderFetchAlbumEvent);
    on<JsonPlaceHolderFetchTodoEvent>(jsonPlaceHolderFetchTodoEvent);
    on<JsonPlaceHolderFetchPhotoEvent>(jsonPlaceHolderFetchPhotoEvent);

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

  Future<FutureOr<void>> jsonPlaceHolderFetchPostEvent(JsonPlaceHolderFetchPostEvent event, Emitter<JsonPlaceHolderState> emit) async {
    try{
      emit(JsonPlaceHolderLoadingState());
      var repo = JsonPlaceholderRepoImpl();
      var response = await repo.getPosts(userId: event.userId!);
      response.fold((l) => emit(JsonPlaceHolderFetchPostSuccessState(postModels: l)), 
      (r) => emit(JsonPlaceHolderFailureState(errorMessge: r)));
    } catch(e){
      emit(JsonPlaceHolderFailureState(errorMessge: e.toString()));
    }
  }

  Future<FutureOr<void>> jsonPlaceHolderFetchAlbumEvent(JsonPlaceHolderFetchAlbumEvent event, Emitter<JsonPlaceHolderState> emit) async {
     try{
      emit(JsonPlaceHolderLoadingState());
      var repo = JsonPlaceholderRepoImpl();
      var response = await repo.getAlbums(userId: event.userId!);
      response.fold((l) => emit(JsonPlaceHolderFetchAlbumSuccessState(albumModel: l)), 
      (r) => emit(JsonPlaceHolderFailureState(errorMessge: r)));
    } catch(e){
      emit(JsonPlaceHolderFailureState(errorMessge: e.toString()));
    }
  }

  Future<FutureOr<void>> jsonPlaceHolderFetchTodoEvent(JsonPlaceHolderFetchTodoEvent event, Emitter<JsonPlaceHolderState> emit) async {
 try{
  emit(JsonPlaceHolderLoadingState());
  var repo = JsonPlaceholderRepoImpl();
  var response = await repo.getTodo(userId: event.userId!);
  response.fold((l) => emit(JsonPlaceHolderFetchTodoSuccessState(todoModels: l)), (r) => emit(JsonPlaceHolderFailureState(errorMessge: r)));
 }
 catch(e){
  emit(JsonPlaceHolderFailureState(errorMessge: e.toString()));
 }
 
  }

  Future<FutureOr<void>> jsonPlaceHolderFetchPhotoEvent(JsonPlaceHolderFetchPhotoEvent event, Emitter<JsonPlaceHolderState> emit) async {
  try{
    emit(JsonPlaceHolderLoadingState());
    var repo = JsonPlaceholderRepoImpl();
    var response = await repo.getPhoto(albumId: event.albumId!);
    response.fold((l) => emit(JsonPlaceHolderFetchPhotoSuccessState(photoModels: l)), (r) => emit(JsonPlaceHolderFailureState(errorMessge: r)));
  } catch(e){
    emit(JsonPlaceHolderFailureState(errorMessge: e.toString()));
  }
  }
}
