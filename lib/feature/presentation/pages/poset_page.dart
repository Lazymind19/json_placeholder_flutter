import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/manager/bloc/json_place_holder_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/user_page.dart';
import 'package:json_placeholder_app_flutter/utils/app_style.dart';

import '../../data/post_model.dart';
import '../widget/post_tile_widget.dart';

class PostPage extends StatefulWidget {
  final JsonPlaceHolderBloc? bloc;
  final int? userId;
  const PostPage({super.key, required this.bloc, required this.userId});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostModel>? postModels;

  @override
  void initState() {
    super.initState();
    widget.bloc?.add(JsonPlaceHolderFetchPostEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonPlaceHolderBloc, JsonPlaceHolderState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state is JsonPlaceHolderLoadingState) {
          return const CustomloadingScreen();
        } else if (state is JsonPlaceHolderFetchPostSuccessState) {
          log("successfully fetched the post  :${state.postModels?.length}");
          postModels = state.postModels!;
        } else if (state is JsonPlaceHolderFailureState) {
          log("Failed to fetch the post : ${state.errorMessge}");
        }
        return postBody();
      },
    );
  }

  postBody() {
    return ListView.builder(
      itemBuilder: (context, index) =>
          PostTileWidget(postModel: postModels![index]),
      itemCount: postModels?.length ?? 0,
    );
  }
}
