import 'package:todoapp/models/task_model.dart';

sealed class TaskEvent {}

class LoadTasks extends TaskEvent {
  List<TaskModel> tasks;
  LoadTasks({required this.tasks});
}

class CalculateFinishedTasks extends TaskEvent {
  int progress;
  CalculateFinishedTasks({required this.progress});
}

class AddTask extends TaskEvent {
  TaskModel task;
  AddTask({required this.task});
}

class ToggleTask extends TaskEvent {
  TaskModel task;
  ToggleTask({required this.task});
}

class EditTask extends TaskEvent {
  TaskModel task;
  EditTask({required this.task});
}

class DeleteTask extends TaskEvent {
  TaskModel task;
  DeleteTask({required this.task});
}
