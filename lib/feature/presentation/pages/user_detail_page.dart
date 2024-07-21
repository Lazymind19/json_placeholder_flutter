import 'package:flutter/material.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';

class UserDetailPage extends StatefulWidget {
  final UserModel? userModel;
  const UserDetailPage({super.key, required this.userModel});

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
            Container(),
            Container(),
            Container()
          ]))
        ],
      )),
    );
  }
}