import 'package:todoapp/models/task_model.dart';

sealed class TaskState {}

class IsLoadingState extends TaskState {}

class IsLoadedState extends TaskState {
  List<TaskModel> tasks = [];
  IsLoadedState(this.tasks);
}

class ErrorState extends TaskState {
  final String message;
  ErrorState(this.message);
}
