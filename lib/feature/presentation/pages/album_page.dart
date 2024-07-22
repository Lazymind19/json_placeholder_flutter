import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/data/album_model.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/manager/bloc/json_place_holder_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/photo_page.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/user_page.dart';
import 'package:json_placeholder_app_flutter/utils/app_style.dart';

class AlbumPage extends StatefulWidget {
  final JsonPlaceHolderBloc? bloc;
  final int? userId;
  const AlbumPage({super.key, this.bloc, this.userId});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
 List<AlbumModel>? albumList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bloc?.add(JsonPlaceHolderFetchAlbumEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<JsonPlaceHolderBloc, JsonPlaceHolderState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if(state is JsonPlaceHolderLoadingState){
          return const CustomloadingScreen();
        }
        else if(state is JsonPlaceHolderFetchAlbumSuccessState){
          log("Successfully fetched the album list : ${state.albumModel.length}");
          albumList = state.albumModel;
        }
        else if(state is JsonPlaceHolderFailureState){
          log("Failed to fetched teh list : ${state.errorMessge}");
        }
        return albumBody();
      },
    );
  }

  albumBody() {
    return ListView.builder(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoPage(
          albumModel: albumList![index],
          bloc: widget.bloc,
        ),)),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          decoration:AppStyle.boxDecoration ,
          child: IntrinsicHeight(
            child: Row(
              children: [
                Text("${albumList?[index].id}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),)
          , const SizedBox(width: 10,) ,  Container(width: 2, color: Colors.grey,),
         const SizedBox(width: 10,),   Expanded(child: Text("${albumList?[index].title}", style: const TextStyle(
          fontWeight: FontWeight.bold
         ),))
              ],
            ),
          ),
        ),
      ),
      itemCount: albumList?.length,
    );
  }
}
