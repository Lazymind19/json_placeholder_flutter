import 'package:flutter/material.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/manager/bloc/json_place_holder_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/album_page.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/poset_page.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/todo_page.dart';

class UserDetailPage extends StatefulWidget {
  final UserModel? userModel;
  final JsonPlaceHolderBloc? bloc;
  const UserDetailPage({super.key, required this.bloc, required this.userModel});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.userModel?.name ?? ""),
      ),

      body:  DefaultTabController(length: 3, child: Column(
        children: [
        const  TabBar(tabs: [
            Tab(text: "Posts",),
                        Tab(text: "Todos",),

            Tab(text: "Albums",),

          ]),
          Expanded(child: TabBarView(children: [
            PostPage(bloc: widget.bloc!, userId: widget.userModel?.id),
                        TodoPage(
                          bloc: widget.bloc,
                          userId: widget.userModel?.id,
                        ),

            AlbumPage(
              bloc: widget.bloc!,
              userId: widget.userModel?.id,
            ),
          ]))
        ],
      )),
    );
  }
}