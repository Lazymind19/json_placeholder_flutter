import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/data/todo_model.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/manager/bloc/json_place_holder_bloc.dart';
import 'package:json_placeholder_app_flutter/feature/presentation/pages/user_page.dart';

import '../../../utils/app_style.dart';

class TodoPage extends StatefulWidget {
  final JsonPlaceHolderBloc? bloc;
  final int? userId;
  const TodoPage({super.key, this.bloc, this.userId});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<TodoModel>? todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bloc?.add(JsonPlaceHolderFetchTodoEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JsonPlaceHolderBloc, JsonPlaceHolderState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if(state is JsonPlaceHolderLoadingState){
          return CustomloadingScreen();
        }
        else if(state is JsonPlaceHolderFetchTodoSuccessState){
          log("Successfully fetched the todo : ${state.todoModels?.length}");
          todoList = state.todoModels;
        }
        else if(state is JsonPlaceHolderFailureState){
          log("Failed to fetch teh todo : ${state.errorMessge}");
        }
        return todoBody();
      },
    );
  }

  todoBody() {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: AppStyle.boxDecoration,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Text(
                "${todoList?[index].id}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${todoList?[index].title}", style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold
                  ),),
                  Row(
                    children: [
                      const Text("Status :", style: TextStyle(fontSize: 14,),),
                     const SizedBox(width: 5,),
                     Text((todoList?[index].completed ?? false) ? "Completed" : "Remaining", style: const TextStyle(
                      fontStyle: FontStyle.italic
                     ),)
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
      itemCount: todoList?.length,
    );
  }
}
