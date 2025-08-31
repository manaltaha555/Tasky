import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/models/task_model.dart';

class TaskController extends Bloc<TaskEvent, TaskState> {
  List<TaskModel> _tasks = [];

  TaskController() : super(IsLoadingState()) {
    on<LoadTasks>((event, emit) async {
      emit(IsLoadingState());
      Future.delayed(Duration(milliseconds: 500));
      try {
        //read the tasks from the file
        // final dir = await getApplicationDocumentsDirectory();
        // File file = File("${dir.path}/tasks.json");

        // if (!(await file.exists())) {
        //   emit(IsLoadedState([])); //empty list there is no data
        // } else {
        //   final jsonString = await file.readAsString();
        //   final data = jsonDecode(jsonString) as List;
        //   _tasks = data.map((e) => TaskModel.fromJson(e)).toList();
        //   emit(IsLoadedState(_tasks));
        // }
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<AddTask>((event, emit) async {
      emit(IsLoadingState());
      Future.delayed(Duration(milliseconds: 500));
      try {
        // //create task
        // final task = TaskModel(
        //   taskName: event.taskName,
        //   taskDescription: event.taskDescription,
        // );
        // //add task to the list
        // _tasks.add(task);
        // //add task to the file
        // final dir = await getApplicationDocumentsDirectory();
        // File file = File("${dir.path}/tasks.json");
        // final jsonString = jsonEncode(_tasks.map((e) => e.toJson()).toList());
        // await file.writeAsString(jsonString);
        // emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<ToggleTask>((event, emit) async {
      emit(IsLoadingState());
      Future.delayed(Duration(milliseconds: 500));
      try {
        // event.task.isFinished = event.isFinished;

        // final dir = await getApplicationDocumentsDirectory();
        // File file = File("${dir.path}/tasks.json");
        // final jsonString = jsonEncode(_tasks.map((e) => e.toJson()).toList());
        // await file.writeAsString(jsonString);
        
        // emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<EditTask>((event, emit) async {
      emit(IsLoadingState());
      try {
        // event.task.taskName = event.taskName;
        // event.task.taskDescription = event.taskDescription;

        // final dir = await getApplicationDocumentsDirectory();
        // File file = File("${dir.path}/tasks.json");
        // final jsonString = jsonEncode(_tasks.map((e) => e.toJson()).toList());
        // await file.writeAsString(jsonString);

        // emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
      //edit task
    });
  }

  // void addTask(String taskName, String taskDescription,){
  //   _tasks.add(TaskModel(taskName: taskName, taskDescription: taskDescription, isFinished: false));
  // }

  // void changeTask(TaskModel task, bool? value){
  //   task.isFinished = value!;
  // }

  // void editTask(TaskModel task, String taskName, String taskDescription){
  //   task.taskName = taskName;
  //   task.taskDescription = taskDescription;
  // }
}
