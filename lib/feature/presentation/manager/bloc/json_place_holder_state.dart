part of 'json_place_holder_bloc.dart';

 class JsonPlaceHolderState extends Equatable {
  const JsonPlaceHolderState();
  
  @override
  List<Object> get props => [];
}

 class JsonPlaceHolderInitial extends JsonPlaceHolderState {}
 class JsonPlaceHolderLoadingState extends JsonPlaceHolderState{}
 class JsonPlaceHolderFetchUserSuccessState extends JsonPlaceHolderState{
  final List<UserModel>? userModels;

  JsonPlaceHolderFetchUserSuccessState({required this.userModels});
 }

  class JsonPlaceHolderFetchTodoSuccessState extends JsonPlaceHolderState{
  final List<TodoModel>? todoModels;

  JsonPlaceHolderFetchTodoSuccessState({required this.todoModels});
 }

  class JsonPlaceHolderFetchPostSuccessState extends JsonPlaceHolderState{
  final List<PostModel>? postModels;

  JsonPlaceHolderFetchPostSuccessState({required this.postModels});
 }
 
   class JsonPlaceHolderFetchPhotoSuccessState extends JsonPlaceHolderState{
  final List<PhotoModel>? photoModels;

  JsonPlaceHolderFetchPhotoSuccessState({required this.photoModels});
 }



 class JsonPlaceHolderFailureState extends JsonPlaceHolderState{
  final String? errorMessge;

  JsonPlaceHolderFailureState({required this.errorMessge});

 }

