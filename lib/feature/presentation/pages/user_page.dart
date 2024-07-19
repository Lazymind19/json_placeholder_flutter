
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/manager/bloc/json_place_holder_bloc.dart';

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
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
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
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset:const Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 2,
                color: Colors.black.withOpacity(0.25)
              )
            ]
          ),
          child: Column(
          children: [
                            Text(userModels[index].name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
 Text("(${userModels[index].email})", style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400, fontStyle: FontStyle.italic
                ),),
        

            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  IconTextWidget(icon: Icons.format_list_bulleted, text: userModels[index].id.toString()),

                      IconTextWidget(
                        icon: Icons.email_outlined,
                        text: userModels[index].email,
                      ),
                      IconTextWidget(icon: Icons.phone_android, text: userModels[index].phone),
                      IconTextWidget(icon: Icons.language, text: userModels[index].website),
                      IconTextWidget(icon: Icons.home_outlined, text: "${userModels[index].address?.zipcode} ${userModels[index].address?.city}, ${userModels[index].address?.street}, ${userModels[index].address?.suite}"),
                      Divider(color: Colors.grey, thickness: 1,),
                      IconTextWidget(icon: Icons.business_outlined, text: userModels[index].company?.name),
                      IconTextWidget(icon: Icons.format_quote_outlined, text: userModels[index].company?.catchPhrase)


                ].map((e) => Padding(padding: EdgeInsets.only(bottom: 10),child: e,)).toList(),
              ),
            ),

        
          ],
        )),
        itemCount: userModels.length,
        shrinkWrap: true,
      ),
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const IconTextWidget({
    super.key,required this.icon,required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Icon(icon),
                SizedBox(width: 20,),
                Expanded(child: Text(text!,))
              ],
            );
  }
}
