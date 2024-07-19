part of 'json_place_holder_bloc.dart';

 abstract class JsonPlaceHolderEvent extends Equatable {
  const JsonPlaceHolderEvent();

  @override
  List<Object> get props => [];
}

class JsonPlaceHolderFetchUserEvent extends JsonPlaceHolderEvent{}
class JsonPlaceHolderFetchTodoEvent extends JsonPlaceHolderEvent{
  final String? userId;

  JsonPlaceHolderFetchTodoEvent({required this.userId});
}

class JsonPlaceHolderFetchAlbumEvent extends JsonPlaceHolderEvent{
  final String? userId;

  JsonPlaceHolderFetchAlbumEvent({required this.userId});
}

class JsonPlaceHolderFetchPhotoEvent extends JsonPlaceHolderEvent{
  final String? albumId;

  JsonPlaceHolderFetchPhotoEvent({required this.albumId});
}
