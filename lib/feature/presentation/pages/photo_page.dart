import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/data/album_model.dart';
import 'package:json_placeholder_app_flutter/feature/data/photo_model.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/manager/bloc/json_place_holder_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/user_page.dart';
import 'package:json_placeholder_app_flutter/utils/app_style.dart';
import 'package:json_placeholder_app_flutter/utils/consts.dart';

class PhotoPage extends StatefulWidget {
  final AlbumModel? albumModel;
  final JsonPlaceHolderBloc? bloc;
  const PhotoPage({super.key, this.albumModel, this.bloc});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  List<PhotoModel>? photoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bloc?.add(JsonPlaceHolderFetchPhotoEvent(albumId: widget.albumModel?.id));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonPlaceHolderBloc, JsonPlaceHolderState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if(state is JsonPlaceHolderLoadingState){
          return const CustomloadingScreen();
        }
        else if(state is JsonPlaceHolderFetchPhotoSuccessState){
          log("Fetched the photo successfully : ${state.photoModels?.length}");
          photoList = state.photoModels;

        }
        else if(state is JsonPlaceHolderFailureState){
          log("Failed to fetch the phot : ${state.errorMessge}");
        }
        return photobody();
      },
    );
  }

  photobody() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.albumModel!.title!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: AppStyle.boxDecoration,
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
               CachedNetworkImage(
                  imageUrl: photoList?[index].url ?? '',
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                  fit: BoxFit.cover,
                ),
                IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text("${index+1}", style: const TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),      Container( width: 2, color: Colors.grey,),
                SizedBox(width: 10,),
                        Expanded(child: Text(photoList?[index].title ?? "", style: TextStyle( fontSize: 14, fontWeight: FontWeight.normal, ),))
                      ],
                
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: photoList?.length ?? 0,
      ),
    );
  }
}
