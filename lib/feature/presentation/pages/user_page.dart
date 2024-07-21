
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/manager/bloc/json_place_holder_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/user_detail_page.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/widget/user_tile_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var jsonPlaceHolderBloc = JsonPlaceHolderBloc();
  List<UserModel> userModels = [];

  @override
  void initState() {
    jsonPlaceHolderBloc.add(JsonPlaceHolderFetchUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonPlaceHolderBloc, JsonPlaceHolderState>(
      bloc: jsonPlaceHolderBloc,
      builder: (context, state) {
        if(state is JsonPlaceHolderLoadingState){
          return const CustomloadingScreen();
        }
        else if(state is JsonPlaceHolderFetchUserSuccessState){
          log("Fetched user success : lenght is : ${state.userModels?.length}");
          userModels = state.userModels!;
        }
        else if (state is JsonPlaceHolderFailureState){
          return Container(
            child: Center(
              child: Text("Something went wrong : ${state.errorMessge.toString()}"),
            ),
          );
        }
        return _userBody();
      },
    );
  }

  Scaffold _userBody() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDetailPage(userModel: userModels[index], bloc: jsonPlaceHolderBloc),)),
          child: UserTileWidget(
            user : userModels[index]
          ),
        ),
       itemCount: userModels.length,
        shrinkWrap: true,
      ),
    );
  }
}

class CustomloadingScreen extends StatelessWidget {
  const CustomloadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
