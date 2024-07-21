part of 'json_place_holder_bloc.dart';

 abstract class JsonPlaceHolderEvent extends Equatable {
  const JsonPlaceHolderEvent();

  @override
  List<Object> get props => [];
}

class JsonPlaceHolderFetchUserEvent extends JsonPlaceHolderEvent{}
class JsonPlaceHolderFetchTodoEvent extends JsonPlaceHolderEvent{
  final int? userId;

  JsonPlaceHolderFetchTodoEvent({required this.userId});
}

class JsonPlaceHolderFetchAlbumEvent extends JsonPlaceHolderEvent{
  final int? userId;

  JsonPlaceHolderFetchAlbumEvent({required this.userId});
}

class JsonPlaceHolderFetchPhotoEvent extends JsonPlaceHolderEvent{
  final int? albumId;

  JsonPlaceHolderFetchPhotoEvent({required this.albumId});
}

class JsonPlaceHolderFetchPostEvent extends JsonPlaceHolderEvent{
  final int? userId;

  JsonPlaceHolderFetchPostEvent({required this.userId});
}
