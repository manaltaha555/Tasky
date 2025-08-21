import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';

class TaskController with ChangeNotifier {

  List<TaskModel> _tasks = [];

  List<TaskModel> get getTasks => _tasks;

  void addTask(String taskName, String taskDescription,){
    _tasks.add(TaskModel(taskName: taskName, taskDescription: taskDescription, isFinished: false));
    notifyListeners();
  }
  
  void changeTask(TaskModel task, bool? value){
    task.isFinished = value!;
    notifyListeners();
  }

  void editTask(TaskModel task, String taskName, String taskDescription){
    task.taskName = taskName;
    task.taskDescription = taskDescription;
    notifyListeners();
  }
}